const stars = document.querySelectorAll('.star');
const ratingInput = document.querySelector('input[name="rating"]');

stars.forEach((star, idx) =>
{
    star.addEventListener('click', () =>
    {
        resetStars();
        fillStars(idx);
        ratingInput.value = idx + 1;
    });

    star.addEventListener('mouseenter', () =>
    {
        resetStars();
        fillStars(idx);
    });

    star.addEventListener('mouseleave', () =>
    {
        resetStars();
        const selectedRating = parseInt(ratingInput.value);
        if (selectedRating)
        {
            fillStars(selectedRating - 1);
        }
    });
});

const resetStars = () =>
{
    stars.forEach(star =>
    {
        star.innerHTML = '&#9734;'; // empty star
        star.classList.remove('selected');
    });
}

const fillStars = (idx) =>
{
    for (let i = 0; i <= idx; i++)
    {
        stars[i].innerHTML = '&#9733;'; // filled star
        stars[i].classList.add('selected');
    }
}
