from django import forms 


class BookTitleFilterForm(forms.Form):
    searchQuery = forms.CharField(required=False, 
                                  widget=forms.TextInput(attrs={'placeholder': 'Search by book or author', 
                                                                'style': 'width: clamp(250px, 30vw, 400px)', 
                                                                'class': 'form-control mx-2'}))
    
