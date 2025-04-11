from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from . import settings
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('library.urls')), 
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/register/', views.register, name='register'),
    path('accounts/register_sucess/', views.register_success, name='register-success'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

