document.querySelectorAll('.star').forEach((star, idx) =>
{
    star.addEventListener('click', () =>
    {
        // reset all stars to unfilled
        document.querySelectorAll('.star').forEach(star =>
        {
            star.innerHTML = '&#9734;';  // 
            star.classList.remove('selected');
        });

        for (let i = 0; i <= idx; i++)
        {
            // set star to filled
            document.querySelectorAll('.star')[i].innerHTML = '&#9733;';
            document.querySelectorAll('.star')[i].classList.add('selected');
        }

        document.querySelector('input[name="rating"]').value = idx + 1;
    });
});
