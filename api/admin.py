from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from .models import *


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name')}),
        (_('Permissions'), {'fields': ('is_superuser',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )
    list_display = ('email', 'first_name', 'last_name', 'is_staff')
    search_fields = ('email', 'first_name', 'last_name')

    ordering = ('email',)


class VideoCategoryInline(admin.StackedInline):
    model = VideoCategory
    can_delete = False


@admin.register(Video)
class VideoAdmin(admin.ModelAdmin):
    inlines = (VideoCategoryInline,)


admin.site.register(Comments)
admin.site.register(Likes)
admin.site.register(Categories)
admin.site.register(Publisher)
