from django.shortcuts import render, redirect
from . import models, forms


def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

def parse(request):
    return render(request, 'parse.html')

def content(request):
    return render(request, 'content.html')

# Create your views here.
