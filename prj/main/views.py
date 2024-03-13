from django.shortcuts import render
from .models import Todo
from .serializers import TodoSerializer
from rest_framework import generics
# Create your views here.


class TodoGetCreate(generics.ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

class TodoUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer



# def todo(request):
#     todos = Todo.objects.all()
#     return render(request, 'todo.html',{'todos': todos})