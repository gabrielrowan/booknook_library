from django.core.management.base import BaseCommand
from library.models import Author

class Command(BaseCommand): 
    help = 'Adds more authors to the author list'

    def handle(self, *args, **options):
        Author.objects.get_or_create(first_name='Stephen', 
                                     last_name= 'Fry',
                                     date_of_birth= '1957-08-24',
                                     bio = 'Stephen Fry (born August 24, 1957, London, England) is a British actor, comedian, author, screenwriter, and director, known especially for his virtuosic command and comical manipulation of the English language—in both speech and writing. He is especially admired for his ability to desacralize even the most serious or taboo of topics.')
        Author.objects.get_or_create(first_name='Madeline', 
                                     last_name= 'Miller',
                                     date_of_birth= '2018-04-10',
                                     bio = 'Madeline Miller was born in Boston and grew up in New York City and Philadelphia. She attended Brown University, where she earned her BA and MA in Classics. For the last ten years she has been teaching and tutoring Latin, Greek and Shakespeare to high school students. She has also studied at the University of Chicago’s Committee on Social Thought, and in the Dramaturgy department at Yale School of Drama, where she focused on the adaptation of classical texts to modern forms. She currently lives in Cambridge, MA, where she teaches and writes. The Song of Achilles is her first novel.')
        Author.objects.get_or_create(first_name='Douglas', 
                                     last_name= 'Adams',
                                     date_of_birth= '1952-03-11',
                                     bio = "Douglas Noel Adams was an English author, humourist, and screenwriter, best known for The Hitchhiker's Guide to the Galaxy (HHGTTG). Originally a 1978 BBC radio comedy, The Hitchhiker's Guide to the Galaxy developed into a 'trilogy' of five books that sold more than 15 million copies in his lifetime. It was further developed into a television series, several stage plays, comics, a video game, and a 2005 feature film.")
        Author.objects.get_or_create(first_name='Tamsyn', 
                                     last_name= 'Muir',
                                     date_of_birth= '1985-03-14',
                                     bio = "Tamsyn Muir the bestselling author of the Locked Tomb Trilogy, which begins with Gideon the Ninth, continues with Harrow the Ninth, and concludes with Alecto the Ninth. Her short fiction has been nominated for the Nebula Award, the Shirley Jackson Award, the World Fantasy Award and the Eugie Foster Memorial Award. A Kiwi, she has spent most of her life in Howick, New Zealand, with time living in Waiuku and central Wellington. She currently lives and works in Oxford, in the United Kingdom.")