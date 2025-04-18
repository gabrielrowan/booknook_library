BEGIN TRANSACTION;
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES(5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES(9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES(13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES(21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES(25,7,'add_author','Can add author');
INSERT INTO "auth_permission" VALUES(26,7,'change_author','Can change author');
INSERT INTO "auth_permission" VALUES(27,7,'delete_author','Can delete author');
INSERT INTO "auth_permission" VALUES(28,7,'view_author','Can view author');
INSERT INTO "auth_permission" VALUES(29,8,'add_genre','Can add genre');
INSERT INTO "auth_permission" VALUES(30,8,'change_genre','Can change genre');
INSERT INTO "auth_permission" VALUES(31,8,'delete_genre','Can delete genre');
INSERT INTO "auth_permission" VALUES(32,8,'view_genre','Can view genre');
INSERT INTO "auth_permission" VALUES(33,9,'add_series','Can add series');
INSERT INTO "auth_permission" VALUES(34,9,'change_series','Can change series');
INSERT INTO "auth_permission" VALUES(35,9,'delete_series','Can delete series');
INSERT INTO "auth_permission" VALUES(36,9,'view_series','Can view series');
INSERT INTO "auth_permission" VALUES(37,10,'add_book','Can add book');
INSERT INTO "auth_permission" VALUES(38,10,'change_book','Can change book');
INSERT INTO "auth_permission" VALUES(39,10,'delete_book','Can delete book');
INSERT INTO "auth_permission" VALUES(40,10,'view_book','Can view book');
INSERT INTO "auth_permission" VALUES(41,11,'add_subgenre','Can add sub genre');
INSERT INTO "auth_permission" VALUES(42,11,'change_subgenre','Can change sub genre');
INSERT INTO "auth_permission" VALUES(43,11,'delete_subgenre','Can delete sub genre');
INSERT INTO "auth_permission" VALUES(44,11,'view_subgenre','Can view sub genre');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$870000$KJ2ZrZPuav22whnLYKrx8H$VEiOIFfKkYQxUuGwUGQK5sq8EkQU4RRy2j/HJnUZZbs=','2025-02-03 15:09:28.275929',1,'gabriel','','',1,1,'2025-01-20 14:13:25.666809','');
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'1','Samantha Shannon',1,'[{"added": {}}]',7,1,'2025-01-20 14:29:56.955108');
INSERT INTO "django_admin_log" VALUES(2,'1','The Roots of Chaos',1,'[{"added": {}}]',9,1,'2025-01-20 14:35:56.256330');
INSERT INTO "django_admin_log" VALUES(3,'1','Fantasy',1,'[{"added": {}}]',8,1,'2025-01-20 14:36:40.874573');
INSERT INTO "django_admin_log" VALUES(4,'2','Young Adult',1,'[{"added": {}}]',8,1,'2025-01-20 14:36:45.074073');
INSERT INTO "django_admin_log" VALUES(5,'3','LGBTQ',1,'[{"added": {}}]',8,1,'2025-01-20 14:36:54.744659');
INSERT INTO "django_admin_log" VALUES(6,'4','Sci Fi',1,'[{"added": {}}]',8,1,'2025-01-20 14:37:03.181949');
INSERT INTO "django_admin_log" VALUES(7,'5','Autobiography',1,'[{"added": {}}]',8,1,'2025-01-20 14:37:12.208958');
INSERT INTO "django_admin_log" VALUES(8,'6','Comedy',1,'[{"added": {}}]',8,1,'2025-01-20 14:37:23.720968');
INSERT INTO "django_admin_log" VALUES(9,'1','A Day of Fallen Night',1,'[{"added": {}}]',10,1,'2025-01-20 14:42:49.718261');
INSERT INTO "django_admin_log" VALUES(10,'2','The Priory of the Orange Tree',1,'[{"added": {}}]',10,1,'2025-01-20 14:44:09.645435');
INSERT INTO "django_admin_log" VALUES(11,'1','A Day of Fallen Night',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-01-20 15:46:44.023952');
INSERT INTO "django_admin_log" VALUES(12,'2','J. R. R Tolkein',1,'[{"added": {}}]',7,1,'2025-01-21 15:59:11.916361');
INSERT INTO "django_admin_log" VALUES(13,'3','Saara El-Arifi',1,'[{"added": {}}]',7,1,'2025-01-21 16:01:30.341366');
INSERT INTO "django_admin_log" VALUES(14,'4','Gregory Maguire',1,'[{"added": {}}]',7,1,'2025-01-21 16:03:46.997020');
INSERT INTO "django_admin_log" VALUES(15,'3','The Hobbit',1,'[{"added": {}}]',10,1,'2025-01-21 16:10:33.434827');
INSERT INTO "django_admin_log" VALUES(16,'2','The Faebound Trilogy',1,'[{"added": {}}]',9,1,'2025-01-21 16:11:09.021222');
INSERT INTO "django_admin_log" VALUES(17,'3','The Lord of the Rings',1,'[{"added": {}}]',9,1,'2025-01-21 16:11:21.852853');
INSERT INTO "django_admin_log" VALUES(18,'4','The Wicked Years',1,'[{"added": {}}]',9,1,'2025-01-21 16:12:15.166455');
INSERT INTO "django_admin_log" VALUES(19,'4','The Fellowship of the Ring',1,'[{"added": {}}]',10,1,'2025-01-21 16:15:29.773359');
INSERT INTO "django_admin_log" VALUES(20,'5','The Two Towers',1,'[{"added": {}}]',10,1,'2025-01-21 16:17:08.535724');
INSERT INTO "django_admin_log" VALUES(21,'6','The Return of the King',1,'[{"added": {}}]',10,1,'2025-01-21 16:18:46.104675');
INSERT INTO "django_admin_log" VALUES(22,'7','Faebound',1,'[{"added": {}}]',10,1,'2025-01-21 16:19:34.831352');
INSERT INTO "django_admin_log" VALUES(23,'4','Gregory Maguire',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-01-21 16:55:23.748026');
INSERT INTO "django_admin_log" VALUES(24,'1','Dragons',1,'[{"added": {}}]',11,1,'2025-01-21 17:37:23.927846');
INSERT INTO "django_admin_log" VALUES(25,'2','Fae',1,'[{"added": {}}]',11,1,'2025-01-21 17:37:26.457143');
INSERT INTO "django_admin_log" VALUES(26,'3','Hobbits',1,'[{"added": {}}]',11,1,'2025-01-21 17:37:30.015524');
INSERT INTO "django_admin_log" VALUES(27,'4','Witches',1,'[{"added": {}}]',11,1,'2025-01-21 17:37:37.438646');
INSERT INTO "django_admin_log" VALUES(28,'4','The Fellowship of the Ring',2,'[]',10,1,'2025-01-22 00:45:15.516407');
INSERT INTO "django_admin_log" VALUES(29,'4','The Fellowship of the Ring',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-01-22 00:46:56.533786');
INSERT INTO "django_admin_log" VALUES(30,'5','The Two Towers',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-01-22 00:50:01.395087');
INSERT INTO "django_admin_log" VALUES(31,'6','The Return of the King',2,'[{"changed": {"fields": ["Cover image", "Subgenre"]}}]',10,1,'2025-01-22 00:50:17.116818');
INSERT INTO "django_admin_log" VALUES(32,'8','Wicked',1,'[{"added": {}}]',10,1,'2025-01-22 15:23:23.617102');
INSERT INTO "django_admin_log" VALUES(33,'9','Son of a Witch',1,'[{"added": {}}]',10,1,'2025-01-22 15:24:16.498051');
INSERT INTO "django_admin_log" VALUES(34,'10','A Lion Among Men',1,'[{"added": {}}]',10,1,'2025-01-22 15:25:04.587973');
INSERT INTO "django_admin_log" VALUES(35,'11','Out of Oz',1,'[{"added": {}}]',10,1,'2025-01-22 15:26:09.660656');
INSERT INTO "django_admin_log" VALUES(36,'12','Cursebound',1,'[{"added": {}}]',10,1,'2025-01-22 15:27:45.398701');
INSERT INTO "django_admin_log" VALUES(37,'7','Faebound',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-01-22 15:28:40.871610');
INSERT INTO "django_admin_log" VALUES(38,'6','The Return of the King',2,'[]',10,1,'2025-01-22 15:28:45.175841');
INSERT INTO "django_admin_log" VALUES(39,'5','The Two Towers',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-01-22 15:28:51.396840');
INSERT INTO "django_admin_log" VALUES(40,'3','The Hobbit',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-01-22 15:28:57.360209');
INSERT INTO "django_admin_log" VALUES(41,'2','The Priory of the Orange Tree',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-01-22 15:29:02.413196');
INSERT INTO "django_admin_log" VALUES(42,'1','A Day of Fallen Night',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-01-22 15:29:06.370993');
INSERT INTO "django_admin_log" VALUES(43,'5','Dragons',1,'[{"added": {}}]',11,1,'2025-01-24 15:21:09.359021');
INSERT INTO "django_admin_log" VALUES(44,'1','Dragons',3,'',11,1,'2025-01-24 15:21:28.229065');
INSERT INTO "django_admin_log" VALUES(45,'2','J. R. R Tolkein',2,'[{"changed": {"fields": ["Bio"]}}]',7,1,'2025-01-24 15:45:43.084433');
INSERT INTO "django_admin_log" VALUES(46,'1','A Day of Fallen Night',2,'[{"changed": {"fields": ["Subgenre"]}}]',10,1,'2025-02-03 15:09:42.962299');
INSERT INTO "django_admin_log" VALUES(47,'11','Out of Oz',2,'[{"changed": {"fields": ["Genre"]}}]',10,1,'2025-02-03 16:00:17.353965');
INSERT INTO "django_admin_log" VALUES(48,'10','A Lion Among Men',2,'[{"changed": {"fields": ["Genre"]}}]',10,1,'2025-02-03 16:00:22.726238');
INSERT INTO "django_admin_log" VALUES(49,'8','Wicked',2,'[{"changed": {"fields": ["Genre"]}}]',10,1,'2025-02-03 16:00:27.782884');
INSERT INTO "django_admin_log" VALUES(50,'7','Faebound',2,'[{"changed": {"fields": ["Genre"]}}]',10,1,'2025-02-03 16:03:59.466653');
INSERT INTO "django_admin_log" VALUES(51,'12','Cursebound',2,'[{"changed": {"fields": ["Genre"]}}]',10,1,'2025-02-03 16:04:08.182434');
INSERT INTO "django_admin_log" VALUES(52,'7','Madeline Miller',2,'[{"changed": {"fields": ["Last name"]}}]',7,1,'2025-02-06 21:38:08.085019');
INSERT INTO "django_admin_log" VALUES(53,'8','Douglas Adams',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:41:56.994806');
INSERT INTO "django_admin_log" VALUES(54,'5','Stephen Fry',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:42:03.893449');
INSERT INTO "django_admin_log" VALUES(55,'7','Madeline Miller',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:42:10.457438');
INSERT INTO "django_admin_log" VALUES(56,'6','Valerie Valdes',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:42:16.536313');
INSERT INTO "django_admin_log" VALUES(57,'6','Valerie Valdes',3,'',7,1,'2025-02-06 21:42:58.004567');
INSERT INTO "django_admin_log" VALUES(58,'9','Madeline Valdes',3,'',7,1,'2025-02-06 21:47:39.769144');
INSERT INTO "django_admin_log" VALUES(59,'10','Tamsyn Muir',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:48:04.711767');
INSERT INTO "django_admin_log" VALUES(60,'5','Stephen Fry',2,'[{"changed": {"fields": ["Photo"]}}]',7,1,'2025-02-06 21:55:34.906738');
INSERT INTO "django_admin_log" VALUES(61,'6','Space',1,'[{"added": {}}]',11,1,'2025-02-07 20:23:49.864408');
INSERT INTO "django_admin_log" VALUES(62,'7','Mythology',1,'[{"added": {}}]',11,1,'2025-02-07 20:24:00.022246');
INSERT INTO "django_admin_log" VALUES(63,'20','Mythos',3,'',10,1,'2025-02-07 21:44:33.674463');
INSERT INTO "django_admin_log" VALUES(64,'21','Heroes',3,'',10,1,'2025-02-07 21:44:48.180153');
INSERT INTO "django_admin_log" VALUES(65,'22','Troy',3,'',10,1,'2025-02-07 21:44:58.091356');
INSERT INTO "django_admin_log" VALUES(66,'23','Odyssey',3,'',10,1,'2025-02-07 21:45:01.832415');
INSERT INTO "django_admin_log" VALUES(67,'30','Gideon the Ninth',3,'',10,1,'2025-02-07 21:45:28.538497');
INSERT INTO "django_admin_log" VALUES(68,'31','Harrow the Ninth',3,'',10,1,'2025-02-07 21:45:32.698626');
INSERT INTO "django_admin_log" VALUES(69,'32','Nona the Ninth',3,'',10,1,'2025-02-07 21:45:36.440846');
INSERT INTO "django_admin_log" VALUES(70,'29','The Song of Achilles',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:33:52.745325');
INSERT INTO "django_admin_log" VALUES(71,'28','Circe',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:34:20.274126');
INSERT INTO "django_admin_log" VALUES(72,'27','So Long, and Thanks for All the Fish',2,'[{"changed": {"fields": ["Num in series", "Cover image", "Description"]}}]',10,1,'2025-02-07 23:34:55.997580');
INSERT INTO "django_admin_log" VALUES(73,'27','So Long, and Thanks for All the Fish',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:35:24.223324');
INSERT INTO "django_admin_log" VALUES(74,'27','So Long, and Thanks for All the Fish',2,'[{"changed": {"fields": ["Num in series"]}}]',10,1,'2025-02-07 23:35:44.251996');
INSERT INTO "django_admin_log" VALUES(75,'25','The Restaurant at the End of the Universe',2,'[{"changed": {"fields": ["Num in series", "Cover image", "Description"]}}]',10,1,'2025-02-07 23:36:11.580829');
INSERT INTO "django_admin_log" VALUES(76,'26','Life, the Universe and Everything',2,'[{"changed": {"fields": ["Num in series", "Cover image", "Description"]}}]',10,1,'2025-02-07 23:36:46.888562');
INSERT INTO "django_admin_log" VALUES(77,'24','The Hitchhiker''s Guide to the Galaxy',2,'[{"changed": {"fields": ["Num in series", "Cover image", "Description"]}}]',10,1,'2025-02-07 23:37:10.686099');
INSERT INTO "django_admin_log" VALUES(78,'19','Nona the Ninth',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:37:35.971636');
INSERT INTO "django_admin_log" VALUES(79,'18','Harrow the Ninth',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:37:58.746978');
INSERT INTO "django_admin_log" VALUES(80,'17','Gideon the Ninth',2,'[{"changed": {"fields": ["Cover image", "Description"]}}]',10,1,'2025-02-07 23:38:19.076879');
INSERT INTO "django_admin_log" VALUES(81,'16','Troy',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-02-07 23:38:31.452464');
INSERT INTO "django_admin_log" VALUES(82,'15','Odyssey',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-02-07 23:38:39.374782');
INSERT INTO "django_admin_log" VALUES(83,'14','Heroes',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-02-07 23:38:49.150604');
INSERT INTO "django_admin_log" VALUES(84,'13','Mythos',2,'[{"changed": {"fields": ["Cover image"]}}]',10,1,'2025-02-07 23:38:59.865323');
INSERT INTO "django_admin_log" VALUES(85,'17','Gideon the Ninth',2,'[{"changed": {"fields": ["Description"]}}]',10,1,'2025-02-08 13:44:20.003721');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','group');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'library','author');
INSERT INTO "django_content_type" VALUES(8,'library','genre');
INSERT INTO "django_content_type" VALUES(9,'library','series');
INSERT INTO "django_content_type" VALUES(10,'library','book');
INSERT INTO "django_content_type" VALUES(11,'library','subgenre');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2025-01-20 14:10:42.012098');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2025-01-20 14:10:42.039722');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2025-01-20 14:10:42.056324');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2025-01-20 14:10:42.067051');
INSERT INTO "django_migrations" VALUES(5,'admin','0003_logentry_add_action_flag_choices','2025-01-20 14:10:42.081059');
INSERT INTO "django_migrations" VALUES(6,'contenttypes','0002_remove_content_type_name','2025-01-20 14:10:42.098967');
INSERT INTO "django_migrations" VALUES(7,'auth','0002_alter_permission_name_max_length','2025-01-20 14:10:42.116609');
INSERT INTO "django_migrations" VALUES(8,'auth','0003_alter_user_email_max_length','2025-01-20 14:10:42.133858');
INSERT INTO "django_migrations" VALUES(9,'auth','0004_alter_user_username_opts','2025-01-20 14:10:42.146370');
INSERT INTO "django_migrations" VALUES(10,'auth','0005_alter_user_last_login_null','2025-01-20 14:10:42.160041');
INSERT INTO "django_migrations" VALUES(11,'auth','0006_require_contenttypes_0002','2025-01-20 14:10:42.160041');
INSERT INTO "django_migrations" VALUES(12,'auth','0007_alter_validators_add_error_messages','2025-01-20 14:10:42.176841');
INSERT INTO "django_migrations" VALUES(13,'auth','0008_alter_user_username_max_length','2025-01-20 14:10:42.197158');
INSERT INTO "django_migrations" VALUES(14,'auth','0009_alter_user_last_name_max_length','2025-01-20 14:10:42.209294');
INSERT INTO "django_migrations" VALUES(15,'auth','0010_alter_group_name_max_length','2025-01-20 14:10:42.223741');
INSERT INTO "django_migrations" VALUES(16,'auth','0011_update_proxy_permissions','2025-01-20 14:10:42.226182');
INSERT INTO "django_migrations" VALUES(17,'auth','0012_alter_user_first_name_max_length','2025-01-20 14:10:42.242794');
INSERT INTO "django_migrations" VALUES(18,'library','0001_initial','2025-01-20 14:10:42.259282');
INSERT INTO "django_migrations" VALUES(19,'sessions','0001_initial','2025-01-20 14:10:42.276359');
INSERT INTO "django_migrations" VALUES(20,'library','0002_alter_series_options_series_author','2025-01-20 14:33:36.306707');
INSERT INTO "django_migrations" VALUES(21,'library','0003_book_num_pages','2025-01-20 14:39:59.835294');
INSERT INTO "django_migrations" VALUES(22,'library','0004_subgenre_book_subgenre','2025-01-21 17:28:33.341293');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('8a4vyvu10nbed938jd85bg2t5tcfg3bj','.eJxVjEsOAiEQRO_C2pAG5KNL956BNNAtowaS-ayMd1eSWeiqknqv6iUibmuN20JznIo4CyUOv13C_KA2QLlju3WZe1vnKcmhyJ0u8toLPS-7-3dQcaljTRyKIasAyOigwDEU0KfAviSFRw8OLftstP1mtkA-geYQjHWOkxHvD97GN5s:1tZsXr:ui90e3zet6vzP-UTjJ9_WCHdMYstsjKNcICmmobEjtw','2025-02-03 14:14:27.862706');
INSERT INTO "django_session" VALUES('esvyi47y42o5jphyoz5jxfisivez2n37','.eJxVjEsOAiEQRO_C2pAG5KNL956BNNAtowaS-ayMd1eSWeiqknqv6iUibmuN20JznIo4CyUOv13C_KA2QLlju3WZe1vnKcmhyJ0u8toLPS-7-3dQcaljTRyKIasAyOigwDEU0KfAviSFRw8OLftstP1mtkA-geYQjHWOkxHvD97GN5s:1tZsiX:WWUldXJQmVJrvgH6x6XuEV8AimtFffOkMnpZTGity4o','2025-02-03 14:25:29.693488');
INSERT INTO "django_session" VALUES('wpnsg65pw6lmanw16ckicczbvx9jl6z0','.eJxVjEsOAiEQRO_C2pAG5KNL956BNNAtowaS-ayMd1eSWeiqknqv6iUibmuN20JznIo4CyUOv13C_KA2QLlju3WZe1vnKcmhyJ0u8toLPS-7-3dQcaljTRyKIasAyOigwDEU0KfAviSFRw8OLftstP1mtkA-geYQjHWOkxHvD97GN5s:1tey4m:40gXuKWn07knXtZiUqCVfriLJP7PpM8WU0eMPdLgncg','2025-02-17 15:09:28.282929');
CREATE TABLE "library_author" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "first_name" varchar(100) NOT NULL, "last_name" varchar(100) NOT NULL, "date_of_birth" date NULL, "bio" text NOT NULL, "photo" varchar(100) NULL);
INSERT INTO "library_author" VALUES(1,'Samantha','Shannon','1991-08-11','Samantha Shannon is an award-winning New York Times and Sunday Times bestselling fantasy author. 



Born in London in 1991, Samantha studied English Language and Literature at the University of Oxford from 2010 to 2013. 



In 2013, at the age of 21, she published The Bone Season, the internationally bestselling first instalment in a seven-book series of fantasy novels. Her first book outside the series, The Priory of the Orange Tree, has sold over a million copies in English worldwide. Its prequel, A Day of Fallen Night, hit shelves in February 2023, becoming an instant #1 Sunday Times bestseller.','authors/samantha_shannon.jpg');
INSERT INTO "library_author" VALUES(2,'J. R. R','Tolkein','1892-01-03','John Ronald Philip Reuel Tolkien (called Ronald for short; b. January 3, 1892 in South Africa û died September 2, 1973 in England) is best known as the author of The Hobbit and its sequel The Lord of the Rings. Among many academic positions, he was professor of Anglo-Saxon language at the University of Oxford from 1925 to 1945, and of English studies (English language and literature), also at Oxford, from 1945 to 1959.



Tolkien was a close friend of C.S. Lewis, with whom he shared membership in the literary discussion group.','authors/tolkein.jpg');
INSERT INTO "library_author" VALUES(3,'Saara','El-Arifi',NULL,'Saara El-Arifi is the internationally bestselling author of The Ending Fire Trilogy and the Faebound Trilogy inspired by her Ghanaian and Sudanese heritage. She has lived in many countries, had many jobs, and owned many more cats.



 



After a decade of working in marketing and communications, she returned to academia to complete a masterÆs degree in African studies alongside her writing career. El-Arifi knew she was a storyteller from the moment she told her first lie. Over the years, she has perfected her tall tales into epic ones. She currently resides in London as a full-time procrastinator.','authors/saaraelarifi.jpg');
INSERT INTO "library_author" VALUES(4,'Gregory','Maguire','1954-06-09','Gregory Maguire is a writer of several dozen crossover books for adults and children. His best-known work is Wicked.



He also helped found and for 25 years codirected ChildrenÆs Literature New England, Inc., a nonprofit that raises awareness of the significance of literature in the lives of children.','authors/Gregory-Maguire.jpg');
INSERT INTO "library_author" VALUES(5,'Stephen','Fry','1957-08-24','Stephen Fry (born August 24, 1957, London, England) is a British actor, comedian, author, screenwriter, and director, known especially for his virtuosic command and comical manipulation of the English languageùin both speech and writing. He is especially admired for his ability to desacralize even the most serious or taboo of topics.','authors/stephen_fry_2.jpg');
INSERT INTO "library_author" VALUES(7,'Madeline','Miller','2018-04-10','Madeline Miller was born in Boston and grew up in New York City and Philadelphia. She attended Brown University, where she earned her BA and MA in Classics. For the last ten years she has been teaching and tutoring Latin, Greek and Shakespeare to high school students. She has also studied at the University of ChicagoÆs Committee on Social Thought, and in the Dramaturgy department at Yale School of Drama, where she focused on the adaptation of classical texts to modern forms. She currently lives in Cambridge, MA, where she teaches and writes. The Song of Achilles is her first novel.','authors/madeline_miller_uZzc1R2.jpg');
INSERT INTO "library_author" VALUES(8,'Douglas','Adams','1952-03-11','Douglas Noel Adams was an English author, humourist, and screenwriter, best known for The Hitchhiker''s Guide to the Galaxy (HHGTTG). Originally a 1978 BBC radio comedy, The Hitchhiker''s Guide to the Galaxy developed into a ''trilogy'' of five books that sold more than 15 million copies in his lifetime. It was further developed into a television series, several stage plays, comics, a video game, and a 2005 feature film.','authors/douglas_adams_XhMgqGC.jpg');
INSERT INTO "library_author" VALUES(10,'Tamsyn','Muir','1985-03-14','Tamsyn Muir the bestselling author of the Locked Tomb Trilogy, which begins with Gideon the Ninth, continues with Harrow the Ninth, and concludes with Alecto the Ninth. Her short fiction has been nominated for the Nebula Award, the Shirley Jackson Award, the World Fantasy Award and the Eugie Foster Memorial Award. A Kiwi, she has spent most of her life in Howick, New Zealand, with time living in Waiuku and central Wellington. She currently lives and works in Oxford, in the United Kingdom.','authors/tamsyn_muir.jpg');
CREATE TABLE "library_book" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "publication_date" date NULL, "num_in_series" integer unsigned NULL CHECK ("num_in_series" >= 0), "cover_image" varchar(100) NULL, "description" text NOT NULL, "author_id" bigint NOT NULL REFERENCES "library_author" ("id") DEFERRABLE INITIALLY DEFERRED, "series_id" bigint NULL REFERENCES "library_series" ("id") DEFERRABLE INITIALLY DEFERRED, "num_pages" integer unsigned NULL CHECK ("num_pages" >= 0));
INSERT INTO "library_book" VALUES(1,'A Day of Fallen Night','2023-02-28',1,'books/a_day_of_fallen_night.jpeg','Tunuva Melim is a sister of the Priory. For fifty years, she has trained to slay wyrms û but none have appeared since the Nameless One, and the younger generation is starting to question the Priory''s purpose.



To the north, in the Queendom of Inys, Sabran the Ambitious has married the new King of Hr¾th narrowly saving both realms from ruin. Their daughter, Glorian, trails in their shadow - exactly where she wants to be.



The dragons of the East have slept for centuries. Dumai has spent her life in a Seiikinese mountain temple, trying to wake the gods from their long slumber. Now someone from her mother''s past is coming to upend her fate.

When the Dreadmount erupts, bringing with it an age of terror and violence, these women must find the strength to protect humankind from a devastating threat.



Intricate and epic, A Day of Fallen Night sweeps readers back to the world of A Priory of the Orange Tree, showing us a course of events that shaped it for generations to come.',1,1,880);
INSERT INTO "library_book" VALUES(2,'The Priory of the Orange Tree','2019-02-26',2,'books/priory_of_the_orange_tree.jpeg','A world divided. A queendom without an heir. An ancient enemy awakens.



The House of Berethnet has ruled Inys for a thousand years. Still unwed, Queen Sabran the Ninth must conceive a daughter to protect her realm from destruction û but assassins are getting closer to her door.



Ead Duryan is an outsider at court. Though she has risen to the position of lady-in-waiting, she is loyal to a hidden society of mages. Ead keeps a watchful eye on Sabran, secretly protecting her with forbidden magic.



Across the dark sea, TanÚ has trained to be a dragonrider since she was a child, but is forced to make a choice that could see her life unravel.



Meanwhile, the divided East and West refuse to parley, and forces of chaos are rising from their sleep.',1,1,845);
INSERT INTO "library_book" VALUES(3,'The Hobbit','1937-09-21',NULL,'books/320px-The_Hobbit_2016-facsimile.jpeg','In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.



Written for J.R.R. TolkienÆs own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent.',2,NULL,372);
INSERT INTO "library_book" VALUES(4,'The Fellowship of the Ring','1954-07-29',1,'books/A1Nv8Uz0fKL._SY522_.jpg','The Fellowship of the Ring is the first of three volumes of the epic novel[1] The Lord of the Rings by the English author J. R. R. Tolkien; it is followed by The Two Towers and The Return of the King. The action takes place in the fictional universe of Middle-earth.



Bilbo celebrates his eleventy-first (111th) birthday and leaves the Shire suddenly, passing the Ring to Frodo Baggins, his cousin[d] and heir. Neither Hobbit is aware of the Ring''s origin, but Gandalf (a wizard) suspects it is a Ring of Power...',2,3,531);
INSERT INTO "library_book" VALUES(5,'The Two Towers','1954-11-11',2,'books/the_two_towers.jpg','The Two Towers is the second part of J.R.R. TolkienÆs epic adventure The Lord of the Rings.



One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them.



Frodo and his Companions of the Ring have been beset by danger during their quest to prevent the Ruling Ring from falling into the hands of the Dark Lord by destroying it in the Cracks of Doom. They have lost the wizard, Gandalf, in a battle in the Mines of Moria. And Boromir, seduced by the power of the Ring, tried to seize it by force. While Frodo and Sam made their escape, the rest of the company was attacked by Orcs. Now they continue the journey alone down the great River Anduinùalone, that is, save for the mysterious creeping figure that follows wherever they go.',2,3,352);
INSERT INTO "library_book" VALUES(6,'The Return of the King','1955-10-20',3,'books/the_return_of_the_king.jpg','One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them.



The Dark Lord has risen, and as he unleashes hordes of Orcs to conquer all Middle-earth, Frodo and Sam struggle deep into his realm in Mordor.



To defeat Sauron, the One Ring must be destroyed in the fires of Mount Doom. But the way is impossibly hard, and Frodo is weakening. The Ring corrupts all who bear it and FrodoÆs time is running out.



Will Sam and Frodo succeed, or will the Dark Lord rule Middle-earth once more?',2,3,432);
INSERT INTO "library_book" VALUES(7,'Faebound','2024-01-18',1,'books/faebound.jpg','Yeeran is a warrior in the elven army and has known nothing but violence her whole life. Her sister, Lettle, is trying to make a living as a diviner, seeking prophecies of a better future.



When a fatal mistake leads to YeeranÆs exile from the Elven lands, they are both forced into the terrifying wilderness beyond their borders. There they encounter the the fae court.



The fae havenÆt been seen for a millennium. But now Yeeran and Lettle are thrust into their seductive world û torn between their loyalty to each other, their elven homeland, and their hearts. . .',3,2,386);
INSERT INTO "library_book" VALUES(8,'Wicked','1995-09-25',1,'books/wicked_1.jpg','When Dorothy triumphed over the Wicked Witch of the West in L. Frank Baum''s classic tale, we heard only her side of the story. But what about her arch-nemesis, the mysterious witch? Where did she come from? How did she become so wicked? And what is the true nature of evil?



Gregory Maguire creates a fantasy world so rich and vivid that we will never look at Oz the same way again. Wicked is about a land where animals talk and strive to be treated like first-class citizens, Munchkinlanders seek the comfort of middle-class stability and the Tin Man becomes a victim of domestic violence. And then there is the little green-skinned girl named Elphaba, who will grow up to be the infamous Wicked Witch of the West, a smart, prickly and misunderstood creature who challenges all our preconceived notions about the nature of good and evil.',4,4,406);
INSERT INTO "library_book" VALUES(9,'Son of a Witch','2005-09-27',2,'books/son_of_a_witch_2.jpg','Liir hid in the shadows of the castle after Dorothy did in the Witch. Left for dead in a gully, the teen is shattered in spirit and body. But silent novice Candle tends him at the Cloister of Saint Glinda, and wills him back to life with her music.



What dark force left Liir in this condition? Is he really Elphaba''s son? He has her broom and her cape - but what of her powers? Can he find his supposed half-sister, Nor, last seen in the forbidding prison Southstairs? Can he fulfill the last wishes of a dying princess? In an Oz under new and dangerous management, can Liir keep his head down long enough to grow up?',4,4,352);
INSERT INTO "library_book" VALUES(10,'A Lion Among Men','2008-10-14',3,'books/a_lion_among_men_3.jpg','In this much-anticipated third volume of the Wicked Years, we return to Oz, seen now through the eyes of the Cowardly Lion - the once tiny cub defended by Elphaba in Wicked. While civil war looms, a tetchy oracle named Yackle prepares for death. Before her final hour, an enigmatic figure known as Brrr - the Cowardly Lion - arrives searching for information about Elphaba Thropp, the Wicked Witch of the West. As payment, Yackle demands some answers of her own. Brrr surrenders his story: abandoned as a cub, his earliest memories are gluey hazes, and his life''s path is no Yellow Brick Road. A Lion Among Men chronicles a battle of wits hastened by the Emerald City''s approaching armies. At once a portrait of a would-be survivor and a panoramic glimpse of a world gone shrill with war fever, Gregory Maguire''s new novel is written with the sympathy and power that have made his books contemporary classics.',4,4,312);
INSERT INTO "library_book" VALUES(11,'Out of Oz','2011-11-01',4,'books/out_of_oz_4.jpg','Oz is knotted with social unrest: The Emerald City is mounting an invasion of Munchkinland, Glinda is under house arrest, the Cowardly Lion is on the run from the law, and Dorothy is back. Amid chaos and war, ElphabaÆs green granddaughter born at the end of "Son of a Witch", comes of age. Rain will take up her broom, and bring the series to a close.',4,4,568);
INSERT INTO "library_book" VALUES(12,'Cursebound','2025-02-15',2,'books/cursebound.jpg','The second book in the enchanting trilogy about two elven sisters who become imprisoned in the intoxicating world of the fae, where danger and love lie in wait, from the Sunday Times bestselling author of Faebound.



Yeeran and her sister Lettle find themselves torn between love and duty as the war between the fae and elven kingdoms heats up.',3,2,352);
INSERT INTO "library_book" VALUES(13,'Mythos','2017-11-02',1,'books/mythos.jpg','Mythos is a modern collection of Greek myths, stylishly retold by legendary writer, actor, and comedian Stephen Fry. Fry transforms the adventures of Zeus and the Olympians into emotionally resonant and deeply funny stories, without losing any of their original wonder.',5,5,NULL);
INSERT INTO "library_book" VALUES(14,'Heroes','2018-11-01',2,'books/heroes.jpg','There are Heroes - and then there are Greek Heroes. Few mere mortals have ever embarked on such bold and heart-stirring adventures, overcome myriad monstrous perils, or outwitted scheming vengeful gods, quite as stylishly and triumphantly as Greek heroes.',5,5,NULL);
INSERT INTO "library_book" VALUES(15,'Odyssey','2024-09-26',4,'books/odyssey.jpg','Follow Odysseus after he leaves the fallen city of Troy and takes ten long dramatic yearsùbattling monsters, the temptations of goddesses and suffering the curse of Poseidonùto voyage home to his wife Penelope on the island of Ithaca.',5,5,NULL);
INSERT INTO "library_book" VALUES(16,'Troy','2020-10-29',3,'books/troy.jpg','The story of Troy speaks to all of us - the kidnapping of Helen, a queen celebrated for her beauty, sees the Greeks launch a thousand ships against the city of Troy, to which they will lay siege for ten whole years. It is a terrible war with casualties on all sides as well as strained relations between allies, whose consequences become tragedies.',5,5,NULL);
INSERT INTO "library_book" VALUES(17,'Gideon the Ninth','2019-09-10',1,'books/gideon.jpg','Gideon has a sword and no more time for undead bullsh*t.



Brought up by unfriendly, ossifying nuns, ancient retainers, and countless skeletons, Gideon is ready to abandon a life of servitude and an afterlife as a reanimated corpse. She packs up her sword, her shoes, and her dirty magazines, and prepares to launch her daring escape. But her childhood nemesis won''t set her free without a service.',10,7,NULL);
INSERT INTO "library_book" VALUES(18,'Harrow the Ninth','2020-08-04',2,'books/harrow.jpg','After rocking the cosmos with her deathly debut, Tamsyn Muir continues the story of the penumbral Ninth House in Harrow the Ninth, a mind-twisting puzzle box of mystery, murder, magic, and mayhem. Nothing is as it seems in the halls of the Emperor, and the fate of the galaxy rests on one woman''s shoulders.',10,7,NULL);
INSERT INTO "library_book" VALUES(19,'Nona the Ninth','2022-09-13',3,'books/nona.jpg','In many ways, Nona is like other people. She lives with her family, has a job at her local school, and loves walks on the beach and meeting new dogs. But Nona''s not like other people. Six months ago she woke up in a stranger''s body, and she''s afraid she might have to give it back.',10,7,NULL);
INSERT INTO "library_book" VALUES(24,'The Hitchhiker''s Guide to the Galaxy','1979-10-12',1,'books/hitchhikers_OKlXwT0.jpg','Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker''s Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.',8,6,NULL);
INSERT INTO "library_book" VALUES(25,'The Restaurant at the End of the Universe','1980-10-12',2,'books/restaurant.jpg','Facing annihilation at the hands of the warlike Vogons is a curious time to have a cosmically displaced Arthur Dent and his curious comrades in arms as they hurtle through space powered by pure improbability - and desperately in search of a place to eat. Among Arthur''s motley shipmates are Ford Prefect, a long-time friend and contributor to the The Hitch Hiker''s Guide to the Galaxy; Zaphod Beeblebrox, the three-armed, two-headed ex-president of the galaxy; Tricia McMilan, a fellow Earth refuge who''s gone native (her name is Trillian now); and Marvin, who suffers nothing and no one gladly.',8,6,NULL);
INSERT INTO "library_book" VALUES(26,'Life, the Universe and Everything','1982-10-12',3,'books/life.jpg','The unhappy inhabitants of planet Krikkit are sick of looking at the night sky above their headsùso they plan to destroy it. The universe, that is. Now only five individuals stand between the killer robots of Krikkit and their goal of total annihilation.',8,6,NULL);
INSERT INTO "library_book" VALUES(27,'So Long, and Thanks for All the Fish','1984-10-12',4,'books/fish.jpg','Back on Earth with nothing more to show for his long, strange trip through time and space than a ratty towel and a plastic shopping bag, Arthur Dent is ready to believe that the past eight years were all just a figment of his stressed-out imagination. But a gift-wrapped fishbowl with a cryptic inscription, the mysterious disappearance of Earth''s dolphins, and the discovery of his battered copy of The Hitchhiker''s Guide to the Galaxy all conspire to give Arthur the sneaking suspicion that something otherworldly is indeed going on. . . .',8,6,NULL);
INSERT INTO "library_book" VALUES(28,'Circe','2018-04-10',NULL,'books/circe.jpg','In the house of Helios, god of the sun and mightiest of the Titans, a daughter is born. But Circe is a strange child--neither powerful like her father nor viciously alluring like her mother. Turning to the world of mortals for companionship, she discovers that she does possess power: the power of witchcraft, which can transform rivals into monsters and menace the gods themselves.',7,NULL,NULL);
INSERT INTO "library_book" VALUES(29,'The Song of Achilles','2011-09-20',NULL,'books/achilles.jpg','Achilles, "the best of all the Greeks," son of the cruel sea goddess Thetis and the legendary king Peleus, is strong, swift, and beautiful, irresistible to all who meet him. Patroclus is an awkward young prince, exiled from his homeland after an act of shocking violence. Brought together by chance, they forge an inseparable bond, despite risking the gods'' wrath.',7,NULL,NULL);
CREATE TABLE "library_book_genre" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "book_id" bigint NOT NULL REFERENCES "library_book" ("id") DEFERRABLE INITIALLY DEFERRED, "genre_id" bigint NOT NULL REFERENCES "library_genre" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "library_book_genre" VALUES(1,1,1);
INSERT INTO "library_book_genre" VALUES(2,2,1);
INSERT INTO "library_book_genre" VALUES(3,3,1);
INSERT INTO "library_book_genre" VALUES(4,4,1);
INSERT INTO "library_book_genre" VALUES(5,5,1);
INSERT INTO "library_book_genre" VALUES(6,6,1);
INSERT INTO "library_book_genre" VALUES(7,11,1);
INSERT INTO "library_book_genre" VALUES(8,10,1);
INSERT INTO "library_book_genre" VALUES(9,8,1);
INSERT INTO "library_book_genre" VALUES(10,7,1);
INSERT INTO "library_book_genre" VALUES(11,12,1);
INSERT INTO "library_book_genre" VALUES(12,13,1);
INSERT INTO "library_book_genre" VALUES(13,14,1);
INSERT INTO "library_book_genre" VALUES(14,15,1);
INSERT INTO "library_book_genre" VALUES(15,16,1);
INSERT INTO "library_book_genre" VALUES(16,17,1);
INSERT INTO "library_book_genre" VALUES(17,18,1);
INSERT INTO "library_book_genre" VALUES(18,19,1);
INSERT INTO "library_book_genre" VALUES(26,24,1);
INSERT INTO "library_book_genre" VALUES(27,25,1);
INSERT INTO "library_book_genre" VALUES(28,26,1);
INSERT INTO "library_book_genre" VALUES(29,27,1);
INSERT INTO "library_book_genre" VALUES(30,28,1);
INSERT INTO "library_book_genre" VALUES(31,29,1);
CREATE TABLE "library_book_subgenre" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "book_id" bigint NOT NULL REFERENCES "library_book" ("id") DEFERRABLE INITIALLY DEFERRED, "subgenre_id" bigint NOT NULL REFERENCES "library_subgenre" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "library_book_subgenre" VALUES(1,6,3);
INSERT INTO "library_book_subgenre" VALUES(2,8,4);
INSERT INTO "library_book_subgenre" VALUES(3,9,4);
INSERT INTO "library_book_subgenre" VALUES(4,10,4);
INSERT INTO "library_book_subgenre" VALUES(5,11,4);
INSERT INTO "library_book_subgenre" VALUES(6,12,2);
INSERT INTO "library_book_subgenre" VALUES(7,7,2);
INSERT INTO "library_book_subgenre" VALUES(8,5,3);
INSERT INTO "library_book_subgenre" VALUES(9,3,3);
INSERT INTO "library_book_subgenre" VALUES(12,1,5);
INSERT INTO "library_book_subgenre" VALUES(13,13,7);
INSERT INTO "library_book_subgenre" VALUES(14,14,7);
INSERT INTO "library_book_subgenre" VALUES(15,15,7);
INSERT INTO "library_book_subgenre" VALUES(16,16,7);
INSERT INTO "library_book_subgenre" VALUES(17,17,6);
INSERT INTO "library_book_subgenre" VALUES(18,18,6);
INSERT INTO "library_book_subgenre" VALUES(19,19,6);
INSERT INTO "library_book_subgenre" VALUES(27,24,6);
INSERT INTO "library_book_subgenre" VALUES(28,25,6);
INSERT INTO "library_book_subgenre" VALUES(29,26,6);
INSERT INTO "library_book_subgenre" VALUES(30,27,6);
INSERT INTO "library_book_subgenre" VALUES(31,28,7);
INSERT INTO "library_book_subgenre" VALUES(32,29,7);
CREATE TABLE "library_genre" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL);
INSERT INTO "library_genre" VALUES(1,'Fantasy');
INSERT INTO "library_genre" VALUES(2,'Young Adult');
INSERT INTO "library_genre" VALUES(3,'LGBTQ');
INSERT INTO "library_genre" VALUES(4,'Sci Fi');
INSERT INTO "library_genre" VALUES(5,'Autobiography');
INSERT INTO "library_genre" VALUES(6,'Comedy');
CREATE TABLE "library_series" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "total_books" integer unsigned NOT NULL CHECK ("total_books" >= 0), "author_id" bigint NULL REFERENCES "library_author" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "library_series" VALUES(1,'The Roots of Chaos',3,1);
INSERT INTO "library_series" VALUES(2,'The Faebound Trilogy',3,3);
INSERT INTO "library_series" VALUES(3,'The Lord of the Rings',3,2);
INSERT INTO "library_series" VALUES(4,'The Wicked Years',4,4);
INSERT INTO "library_series" VALUES(5,'Stephen Fry''s Great Mythology',4,5);
INSERT INTO "library_series" VALUES(6,'The Hitchhiker''s Guide to the Galaxy',4,8);
INSERT INTO "library_series" VALUES(7,'The Locked Tomb',3,10);
CREATE TABLE "library_subgenre" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL);
INSERT INTO "library_subgenre" VALUES(2,'Fae');
INSERT INTO "library_subgenre" VALUES(3,'Hobbits');
INSERT INTO "library_subgenre" VALUES(4,'Witches');
INSERT INTO "library_subgenre" VALUES(5,'Dragons');
INSERT INTO "library_subgenre" VALUES(6,'Space');
INSERT INTO "library_subgenre" VALUES(7,'Mythology');
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "library_book_author_id_d9a3b67e" ON "library_book" ("author_id");
CREATE INDEX "library_book_series_id_6575fc1a" ON "library_book" ("series_id");
CREATE UNIQUE INDEX "library_book_genre_book_id_genre_id_c685f9b3_uniq" ON "library_book_genre" ("book_id", "genre_id");
CREATE INDEX "library_book_genre_book_id_b86cda70" ON "library_book_genre" ("book_id");
CREATE INDEX "library_book_genre_genre_id_f667aa0e" ON "library_book_genre" ("genre_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "library_series_author_id_50958c16" ON "library_series" ("author_id");
CREATE UNIQUE INDEX "library_book_subgenre_book_id_subgenre_id_f7e05f64_uniq" ON "library_book_subgenre" ("book_id", "subgenre_id");
CREATE INDEX "library_book_subgenre_book_id_1efe4db4" ON "library_book_subgenre" ("book_id");
CREATE INDEX "library_book_subgenre_subgenre_id_460a4bd6" ON "library_book_subgenre" ("subgenre_id");
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('django_migrations',22);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',85);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',11);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',44);
INSERT INTO "sqlite_sequence" VALUES('auth_group',0);
INSERT INTO "sqlite_sequence" VALUES('auth_user',1);
INSERT INTO "sqlite_sequence" VALUES('library_author',10);
INSERT INTO "sqlite_sequence" VALUES('library_series',7);
INSERT INTO "sqlite_sequence" VALUES('library_genre',6);
INSERT INTO "sqlite_sequence" VALUES('library_book',32);
INSERT INTO "sqlite_sequence" VALUES('library_book_genre',34);
INSERT INTO "sqlite_sequence" VALUES('library_subgenre',7);
INSERT INTO "sqlite_sequence" VALUES('library_book_subgenre',35);
COMMIT;
