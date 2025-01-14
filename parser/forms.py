from django.forms import forms
from .models import Message

class MessageForm(forms.Form):
    message = forms.FileField(widget=forms.__file__)
    



