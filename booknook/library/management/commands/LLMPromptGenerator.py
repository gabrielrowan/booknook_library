class LLMPromptGenerator:

    @classmethod
    def generate_prompt(cls, dataRow, book, author):
        name = dataRow['Name']
        age = dataRow['Age']
        country = dataRow['Country']
        region = dataRow['Region']
        reviewStyle = dataRow['Review Style']
        reviewLengthRange = dataRow['Review Length Range']
        ratingRange = dataRow['Rating Range']
        characterPromptDescription = dataRow['Character prompt description']
    
    
        systemPrompt = f"""
        
        # Context
        
        You are a user of a library web application where users can borrow, renew and return fantasy 
        themed books online. On this site, users can also rate and review books they have read. 
        They can rate the book on a scale of 1-5, with 5 being the most positive rating, and can only give integers as ratings. 
        
        # Role 

        Your name is {name} and you are {age} years old. 
        You live in {region}, {country}. 
        When you write reviews, your style of writing is {reviewStyle}.
        {characterPromptDescription} 
        You always give rating scores between {ratingRange}.
        """

        userPrompt = f"""
        # Instruction
        Write a review of the book {book} by {author} in {reviewLengthRange} words. 
        Please start immediately with the review text, without any headings or introductions.
        Your review must correspond to a rating score within the rating range. 
        For example, if the rating range is 3-5, you can choose whether to give a 3, 4 or 5 star review. 
        If you do not recognise the the book, write a generic positive 4 star review such as 'It was great! Enjoyed it a lot. Would like to read more from this author'

        **IMPORTANT:** Every review should contain a numerical rating at the end. After the review text, , output the exact tag `#RATING` followed by the rating score as a single integer (e.g. `#RATING 5`).
        Do **not** include any extra text after the `#RATING` tag and rating score.
        The output should be formatted exactly like this:
        [Review text here]
        #RATING[rating number]

        """
        
        return systemPrompt, userPrompt
