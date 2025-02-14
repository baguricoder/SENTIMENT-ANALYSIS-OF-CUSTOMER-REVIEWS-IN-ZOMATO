from importlib.metadata import requires
from webbrowser import get
from django.shortcuts import render,redirect,get_object_or_404
from customerapp.models import CustomerFeedBackModel, CustomersDetialsModel, CustomerMyBooking
from django.contrib import messages
from email import message




from restaurantapp.models import *

# Create your views here.

def restaurant_add_menu(request):
    print('get')
    if request.method == "POST" and "Uploadimage"  in request.FILES:
        print("post")
        itemname = request.POST.get("itemname")
        price = request.POST.get("price")
        offerzone = request.POST.get("offerzone")
        discription = request.POST.get("discription")
        Uploadimage = request.FILES["Uploadimage"]
        itemtype = request.POST.get("itemtype")

        MenuDetialsModel.objects.create(item_name=itemname,item_price=price,item_offer_zone=offerzone,
        item_description=discription,item_image=Uploadimage,item_type=itemtype)


    return render(request,'restaurant/restaurant-add-menu.html') 


def restaurant_customer_review(request):
    fed = CustomerFeedBackModel.objects.all().order_by('feedback_id')
    print(fed)

    
    return render(request,'restaurant/restaurant-customer-review.html',{'p':fed})    


def restaurant_manage_menu(request):

    a=MenuDetialsModel.objects.all()
    print(a)

    return render(request,'restaurant/restaurant-manage-menu.html',{'manage':a})     


def restaurant_sentiment_analysis(request):
    positive = CustomerFeedBackModel.objects.filter(sentiment="Positive").count()
    negative = CustomerFeedBackModel.objects.filter(sentiment="Negative").count()
    neutral = CustomerFeedBackModel.objects.filter(sentiment="Neutral").count()
    verypositive = CustomerFeedBackModel.objects.filter(sentiment="Very Positive").count()
    verynegative = CustomerFeedBackModel.objects.filter(sentiment ="Very Negative").count()
    print(verypositive,'postttt')
    print(verynegative,'sdsd')


    return render(request,'restaurant/restaurant-sentiment-analysis.html',{'Positive':positive,'Negative':negative,'Neutral':neutral,'verypositive':verypositive,'verynegative':verynegative}) 

def restaurant_dashboard(request):
    numofitems = MenuDetialsModel.objects.all().count()
    numoforders = CustomerMyBooking.objects.all().count()
    numofcustomers = CustomersDetialsModel.objects.all().count()
    numoffeedbacks = CustomerFeedBackModel.objects.all().count()


    return render(request, 'restaurant/restuarant-dashboard.html',{'numofitems' :numofitems,'numoforders':numoforders,'numofcustomers':numofcustomers,'numoffeedbacks':numoffeedbacks}) 
    # if request.method == 'POST':
    #     user_name = request.POST['facultyname']
    #     user_email = request.POST['subject']
    #     user_number = request.POST['gender']
    #     user_city = request.POST['email']
    #     user_password = request.POST['mobileno']
        
       
    #     if not request.FILES.get("fpicture",False):
    #         # print("yes efffeg jfkdftjhkt")
    #         obj.user_name = user_name
    #         obj.user_email = user_email
    #         obj.user_number = user_number
    #         obj.user_city = user_city
    #         obj.user_password = user_password
    #         obj.save(update_fields=['user_name', 'user_email', 'user_number',
    #                                     'user_city', 'user_password'])
    #         obj.save()
             
    #     elif request.FILES.get("fpicture",False):
    #         user_pic = request.FILES['fpicture']
    #         obj.user_name = user_name
    #         obj.user_email = user_email
    #         obj.user_number = user_number
    #         obj.user_city = user_city
    #         obj.user_password = user_password
    #         obj.user_pic = user_pic
    #         obj.save(update_fields=['user_name', 'user_email', 'user_number',
    #                                     'user_city', 'user_password', 'user_pic'])
    #         obj.save() 

def restaurant_edit_menu(request,id):
    edit = MenuDetialsModel.objects.get(pk = id)
    data = get_object_or_404(MenuDetialsModel,pk=id)
    if request.method == 'POST':
        itemname = request.POST["itemname"]
        price = request.POST["price"]
        offerzone = request.POST["offerzone"]
        discription = request.POST["discription"]
        itemtype = request.POST["itemtype"]
        # Uploadimage = request.FILES["Uploadimage"]

        
        if not request.FILES.get("uploadimage",False):
            data.item_name = itemname
            data.item_price = price
            data.item_offer_zone = offerzone
            data.item_description = discription
            data.item_type = itemtype
            data.save(update_fields=['item_name','item_price','item_offer_zone','item_description','item_type'])
            data.save()
            

        elif request.FILES.get("uploadimage",False):
            Uploadimage = request.FILES["uploadimage"]

            data.item_name = itemname
            data.item_price = price
            data.item_offer_zone = offerzone
            data.item_description = discription
            data.item_type = itemtype
            data.item_image = Uploadimage
            data.save(update_fields=['item_name','item_price','item_offer_zone','item_description','item_type','item_image'])
            data.save()
       
        return redirect("restaurant_manage_menu")
 

    return render(request,'restaurant/restaurant-edit-menu.html',{'r':edit})  

def restaurant_delete_menu(request ,id):
    delete = get_object_or_404(MenuDetialsModel,item_id= id )
    delete.delete()
    return redirect("restaurant_manage_menu")


def restaurant_login(request):
    print('get')
    if request.method == "POST":
        print('post')
        email = request.POST.get("email")
        password = request.POST.get("password")
        if email == "admin" and password == "admin":
            messages.info(request, "Login Successfully.")
            return redirect("restaurant_dashboard")
            
        else:
            messages.error(request,"Invalid EmailID or Password")
            
    return render(request,'main/restaurant-login.html')
   

def restaurant_pending_orders(request):

    a=CustomerMyBooking.objects.filter(status="pending")
    print(a)
   


    
    
    return render(request,'restaurant/restaurant-pending-orders.html',{'a':a})    


def order_accept(request,id):
    a=CustomerMyBooking.objects.all()
    print(a)
    data = get_object_or_404(CustomerMyBooking, booking_id=id)
    data.status = "Accept"
    data.save(update_fields=['status'])
    data.save()
    
    return redirect("restaurant_all_orders")

 

def order_reject(request,id):
    data = get_object_or_404(CustomerMyBooking, booking_id=id)
    data.status = "reject"
    data.save(update_fields=['status'])
    data.save()
    return redirect("restaurant_pending_orders")



def restaurant_all_orders(request):
    accept = CustomerMyBooking.objects.filter(status="Accept")
    # a=CustomerMyBooking.objects.all()
    # print(a)

    return render(request,'restaurant/restaurant-all-orders.html',{'a':accept})