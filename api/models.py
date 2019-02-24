from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class User(AbstractUser):
    username = models.CharField(blank=True, null=True, max_length=50)
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    publisherId = models.CharField(max_length=50, null=True, blank=True, unique=True)

    def __str__(self):
        return "{}".format(self.email)


class Publisher(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='publisher')

    def __str__(self):
        return "{}".format(self.user)


class Video(models.Model):
    userId = models.ForeignKey(Publisher, on_delete=models.CASCADE, related_name='uploader')
    title = models.CharField(max_length=255)
    path = models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.title)


class Comments(models.Model):
    userId = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='commenter')
    videoId = models.ForeignKey(Video, on_delete=models.CASCADE, related_name='commentVideoId')
    comment = models.TextField()
    date = models.DateField()

    def __str__(self):
        return "{0} Commented on Video {1}. Comment:\"{2}\"".format(self.userId, self.videoId, self.comment)


class Categories(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return "{}".format(self.name)


class VideoCategory(models.Model):
    videoId = models.OneToOneField(Video, on_delete=models.CASCADE, related_name='categoryVideoId')
    category1 = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='vc1')
    category2 = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='vc2', blank=True, null=True)
    category3 = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='vc3', blank=True, null=True)
    category4 = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='vc4', blank=True, null=True)
    category5 = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='vc5', blank=True, null=True)


class Likes(models.Model):
    videoId = models.ForeignKey(Video, on_delete=models.CASCADE, related_name='likeVideoId')
    positive = models.BooleanField()
    userId = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='liker')

    def __str__(self):
        str='Disliked'
        if(self.positive==True):
            str='liked'
        return "{0} {1} {2}".format(self.userId, str, self.videoId)



