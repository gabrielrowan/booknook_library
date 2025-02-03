from django import forms 

class BookTitleFilterForm(forms.Form):
    searchQuery = forms.CharField(required=False, widget=forms.TextInput(attrs={'placeholder': 'Search by book or author', 'style': 'width: 400px;', 'class': 'form-control'}))