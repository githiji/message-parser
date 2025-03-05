from django import forms
from .models import Message

class MessageForm(forms.Form):
    message = forms.CharField(label='enter_file', max_length=100)
    



