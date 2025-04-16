const passwordResetForm = document.querySelector(".password-reset-form");
const passwordResetSubmitButton = document.querySelector(".password-reset-button")

if (passwordResetForm && passwordResetSubmitButton)
{
    console.log("password reset page")
    passwordResetForm.addEventListener("submit", () =>
    {
        console.log("disabled submit button")
        passwordResetSubmitButton.disabled = true
        passwordResetSubmitButton.innerText = "Submitting..."

        setTimeout(() =>
        {
            passwordResetSubmitButton.disabled = false;
            passwordResetSubmitButton.innerText = "Reset Password";
            console.log("Re-enabled submit button after 5 seconds");
        }, 10000);
    })

    console.log("Submit button is enabled?", !passwordResetSubmitButton.disabled)
}