import re

class LLMResponseProcessor:
    @classmethod
    def extract_review_and_rating(cls, response):
        if '#RATING' in response:
            review, rating_part = response.rsplit('#RATING', 1)
            review = review.strip()
            number_match = re.search(r'\d+', rating_part)
            if number_match:
                rating = int(number_match.group())
                return review, rating
            else:
                raise ValueError("No numeric rating found after #RATING")
        else:
            # If there is no numerical rating, don't save the rating or the review
            rating = None
            review = None
            return review, rating