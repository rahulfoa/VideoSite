from django.conf.urls import url, include
from django.urls import path
from rest_framework import routers
from api.views import *

router = routers.DefaultRouter()
router.register('users', UserViewSet)
router.register('videos', VideoViewSet)
router.register('comments', CommentsViewSet)
router.register('likes', LikesViewSet)
router.register('categories', CategoriesViewSet)
router.register('publishers', PublisherViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('auth/', include('rest_auth.urls'))
]