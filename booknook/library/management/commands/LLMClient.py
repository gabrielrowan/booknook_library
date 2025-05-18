import os
from openai import OpenAI
from dotenv import load_dotenv
load_dotenv()

class LLMClient:
    _client = OpenAI(
        base_url="https://api.studio.nebius.ai/v1/",
        api_key=os.environ.get("NEBIUS_API_KEY")
    )
    _model = "meta-llama/Meta-Llama-3.1-8B-Instruct"
    _temperature = 0.9

    @classmethod
    def generate_response(cls, prompt, system_prompt):
        messages = []

        if system_prompt:
            messages.append({"role": "system", "content": system_prompt})

        messages.append({"role": "user", "content": prompt})

        completion = cls._client.chat.completions.create(
            model=cls._model,
            messages=messages,
            temperature=cls._temperature
        )

        return completion.choices[0].message.content
