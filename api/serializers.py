from rest_framework import serializers
from api.models import *


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'email', 'first_name', 'last_name', 'password',)
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        return user

    def update(self, instance, validated_data):
        instance.email = validated_data.get('email', instance.email)
        instance.save()
        return instance


class VideoCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoCategory
        fields = ('videoId', 'category1', 'category2', 'category3', 'category4', 'category5')


class VideoSerializer(serializers.HyperlinkedModelSerializer):
    categoryVideoId = VideoCategorySerializer(required=True)

    class Meta:
        model = Video
        fields = ('userId', 'title', 'path', 'categoryVideoId')

    def create(self, validated_data):
        category_data = validated_data.pop('categoryVideoId')
        video = Video(**validated_data)
        video.save()
        VideoCategory.objects.create(video=video, **category_data)
        return video


class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Likes
        fields = ('videoId', 'positive', 'userId')

    def create(self, validated_data):
        like = Likes(**validated_data)
        like.save()
        return like

    def update(self, instance, validated_data):
        instance.videoId = validated_data.get('videoId', instance.videoId)
        instance.positive = validated_data.get('positive', instance.positive)
        instance.userId = validated_data.get('userId', instance.userId)
        instance.save()
        return instance


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comments
        fields = ('userId', 'videoId', 'comment', 'date')

    def create(self, validated_data):
        comment = Comments(**validated_data)
        comment.save()
        return comment


class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categories
        fields = ('name',)

    def create(self, validated_data):
        category = Categories(**validated_data)
        category.save()
        return category


class PublisherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Publisher
        fields = ('user',)

    def create(self, validated_data):
        publisher = Publisher(**validated_data)
        publisher.save()
        return publisher

