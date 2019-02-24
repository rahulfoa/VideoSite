from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from api.models import *
from api.serializers import *
from api.permissions import IsAdminUser, IsLoggedInUserOrAdmin


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]


class VideoViewSet(viewsets.ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]


class LikesViewSet(viewsets.ModelViewSet):
    queryset = Likes.objects.all()
    serializer_class = LikeSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create' or self.action == 'retrieve' or self.action == 'list':
            permission_classes = [AllowAny]
        elif self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]

class CommentsViewSet(viewsets.ModelViewSet):
    queryset = Comments.objects.all()
    serializer_class = CommentSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create' or self.action == 'retrieve' or self.action == 'list':
            permission_classes = [AllowAny]
        elif self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]


class CategoriesViewSet(viewsets.ModelViewSet):
    queryset = Categories.objects.all()
    serializer_class = CategoriesSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create' or self.action == 'retrieve' or self.action == 'list':
            permission_classes = [AllowAny]
        elif self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]

class PublisherViewSet(viewsets.ModelViewSet):
    queryset = Publisher.objects.all()
    serializer_class = PublisherSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create' or self.action == 'retrieve' or self.action == 'list':
            permission_classes = [AllowAny]
        elif self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'destroy':
            permission_classes = [IsAdminUser]

        return [permission() for permission in permission_classes]