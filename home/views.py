from django.shortcuts import render
import logging

logger = logging.getLogger(__name__)


def home_view(request):
    return render(request, "home.html")
