from django.shortcuts import render, redirect
from . import models, forms


def home(request):
    return render(request, 'parser/home.html')

def about(request):
    return render(request, 'parser/about.html')

def parse(request):
    return render(request, 'parser/parse.html')

def content(request):
    return render(request, 'parser/content.html')

# Create your views here.
