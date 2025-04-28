from django import forms 


class BookTitleFilterForm(forms.Form):
    searchQuery = forms.CharField(required=False, 
                                  widget=forms.TextInput(attrs={'placeholder': 'Search by book or author', 
                                                                'style': 'width: clamp(250px, 30vw, 400px)', 
                                                                'class': 'form-control mx-2'}))
    
class RateAndReviewForm(forms.Form):
    rating = forms.IntegerField(min_value=0, 
                                max_value=5, 
                                widget=forms.NumberInput(attrs={'class': 'form-control'}),
        help_text="Rate the book from 0 to 5.")
    review = forms.CharField(
        widget=forms.Textarea(max_length=2000,  
                            help_text="Share your thoughts about the book.",
                            attrs={'rows': 5, 'placeholder': 'Write your review here...', 
                                     'class': 'form-control'})
    )