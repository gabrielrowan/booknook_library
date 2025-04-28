from django import forms 


class BookTitleFilterForm(forms.Form):
    searchQuery = forms.CharField(required=False, 
                                  widget=forms.TextInput(attrs={'placeholder': 'Search by book or author', 
                                                                'style': 'width: clamp(250px, 30vw, 400px)', 
                                                                'class': 'form-control mx-2'}))
    
class RateAndReviewForm(forms.Form):
    rating = forms.IntegerField(widget=forms.HiddenInput())
    review = forms.CharField(
        widget=forms.Textarea(attrs={
            'rows': 5,
            'placeholder': 'Write your review here...',
            'class': 'form-control'
        })
    )