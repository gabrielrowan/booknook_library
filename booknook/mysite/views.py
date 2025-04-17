from django.shortcuts import render, redirect
from forms import RegisterForm
from django.contrib.auth.forms import PasswordResetForm


def register_success(request):
    return render(request, 'registration/register_success.html')


def register(response):
    if response.method == "POST":
        form = RegisterForm(response.POST)
        if form.is_valid():
            form.save()
            return redirect('register_success')
    else:
        form = RegisterForm()
    
    return render(response, "registration/register.html", {"form": form})
