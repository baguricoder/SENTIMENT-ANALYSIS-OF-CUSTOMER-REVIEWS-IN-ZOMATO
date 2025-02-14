"""restaurent URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as mainapp_views
from customerapp import views as customer_views
from restaurantapp import views as restaurantapp_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),

    #main
    path('', mainapp_views.index,name ='index'),
    path('about',mainapp_views.about,name='about'),
    path('contact',mainapp_views.contact,name='contact'),
    
    #restaurant
    path('restuarant-add-menu',restaurantapp_views.restaurant_add_menu,name = 'restaurant_add_menu'),
    path('restaurant-customer-review',restaurantapp_views.restaurant_customer_review,name = 'restaurant_customer_review'),
    path('restaurant-manage-menu',restaurantapp_views.restaurant_manage_menu,name='restaurant_manage_menu'),
    path('restaurant-sentiment-analysis',restaurantapp_views.restaurant_sentiment_analysis,name='restaurant_sentiment_analysis'),
    path('restaurant-dashboard',restaurantapp_views.restaurant_dashboard,name='restaurant_dashboard'),
    path('restaurant_edit_menu/<int:id>/',restaurantapp_views.restaurant_edit_menu,name='restaurant_edit_menu'),
    path('restaurant-delete-menu/<int:id>/',restaurantapp_views.restaurant_delete_menu,name = 'restaurant_delete_menu'),
    path('restaurant-login', restaurantapp_views.restaurant_login, name='restaurant_login'),
    path('restauant-all-orders', restaurantapp_views.restaurant_all_orders,name='restaurant_all_orders'),
    path('restaurant-pending-orders',restaurantapp_views.restaurant_pending_orders,name='restaurant_pending_orders'),
    path('order-accept/<int:id>/',restaurantapp_views.order_accept,name='order_accept'),
    path('order-reject/<int:id>/',restaurantapp_views.order_reject,name='order_reject'),
    


    # customer
    path('customer-register', customer_views.customer_register, name='customer_register'),
    path('customer-booking',customer_views.customer_booking, name='customer_booking'),
    path('customer_feedback/<int:id>/',customer_views.customer_feedback,name ='customer_feedback'),
    path('customer-login',customer_views.customer_login,name='customer_login'),
    path('customer-offerzone',customer_views.customer_offerzone,name='customer_offerzone'),
    path('customer-food-menu',customer_views.customer_food_menu,name='customer_food_menu'),
    path('customer-book-item/<int:id>/',customer_views.customer_book_item,name='customer_book_item'),
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)