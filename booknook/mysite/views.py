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

class CustomPasswordResetForm(PasswordResetForm):
    def save(self, **kwargs):
        print("Custom save method called")  # Log when save is called
        return super().save(**kwargs)


def password_reset_request(request):
    print("Entered password_reset_request view")
    if request.method == "POST":
        print("Request is POST") 
        form = CustomPasswordResetForm(request.POST)
        if form.is_valid():
            print("Saving form...")
            form.save(
                request=request,
                use_https=True,
                email_template_name='registration/password_reset_email.html',
                subject_template_name='registration/password_reset_subject.txt'
            )
            return redirect('password_reset_done')
    else:
        print("Request is GET")
        form = PasswordResetForm()

    return render(request, "registration/password_reset_form.html", {"form": form})