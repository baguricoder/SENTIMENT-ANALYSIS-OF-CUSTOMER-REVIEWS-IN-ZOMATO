from email import message
from django.shortcuts import render,redirect
from importlib.metadata import requires
from textblob import TextBlob

from customerapp.models import *
from restaurantapp.models import MenuDetialsModel
from django.contrib import messages
from django.db.models import Avg


# Create your views here.
def customer_register(request):
    print('get')
    if request.method == "POST":
        print('post')
        yourname = request.POST.get("yourname")
        phonenumber = request.POST.get("phonenumber")
        password = request.POST.get("password")

        CustomersDetialsModel.objects.create(customer_name=yourname,customer_ph_number=phonenumber,
        customer_password=password)
    return render(request, 'customer/customer-register.html')

def customer_booking(request):

    user_id = request.session['customer_id']
    user=CustomersDetialsModel.objects.get(pk=user_id)

    a=CustomerMyBooking.objects.filter(customer = user)
    print(a)

    
    
    return render(request,'customer/customer-booking.html',{'a':a}) 




def customer_book_item(request,id):
    user_id = request.session['customer_id']
    user=CustomersDetialsModel.objects.get(pk=user_id)
    
    obj=MenuDetialsModel.objects.get(pk=id)
    print(obj)

    CustomerMyBooking.objects.create(customer= user,menu_details=obj)
    messages.success(request, "Order placed successfully")






    return redirect("customer_food_menu")

 


def customer_feedback(request,id):
    customer_id=request.session['customer_id']
    customerfeedback = CustomersDetialsModel.objects.get(customer_id=customer_id)
    booking_id =CustomerMyBooking.objects.get(booking_id=id)
    a=customerfeedback.customer_name
    print(a)
    if request.method == "POST":
        print('not done')
        
        if not request.POST.get('a'):
            messages.info(request, 'Please rate for taste')
            return redirect('customer_feedback',id=customer_id)
        taste_feedback = request.POST['a']
        print(taste_feedback,'a')
        if not request.POST.get('b'):
            messages.info(request, 'Please rate for price')
            return redirect('customer_feedback',id=customer_id)
        price_feedback = request.POST['b']
        if not request.POST.get('c'):
            messages.info(request,'Please rate for Service')
            return redirect('customer_feedback',id=customer_id)
        service_feedback = request.POST['c']
        overview = request.POST.get('overall')
        # print(dfkasjd)
        #text analysis
        analysis = TextBlob(overview)
        print(analysis.sentiment)
        sentiment = ""
        polarity = analysis.polarity
        if polarity>=0.5: # type: ignore
            sentiment='Very Positive'
        elif polarity > 0  and polarity < 0.5:  # type: ignore
            sentiment='Positive'
        elif analysis.polarity < 0  and analysis.polarity > -0.5: # type: ignore
            sentiment='Negative' 
        elif analysis.polarity <= -0.5: # type: ignore
            sentiment='Very Negative'       
        else:
            sentiment='Neutral'
        CustomerFeedBackModel.objects.create(taste_feedback=taste_feedback,
        price_feedback=price_feedback,service_feedback=service_feedback,
        overview=overview,sentiment=sentiment,customer=customerfeedback,item=booking_id)
        print(customer_feedback,'created')
        messages.success(request,"Feedback send successfully")
        


        return redirect("customer_booking")
    else:
        return render(request,'customer/customer-feedback.html') 

def customer_login(request):
    if request.method == "POST":
        phonenumber = request.POST["phonenumber"]
        print(phonenumber)
        password = request.POST["password"]
        print(password)

        # customer = CustomersDetialsModel.objects.get(customer_ph_number = phonenumber, custome_password = password)

        try:
            customer = CustomersDetialsModel.objects.get(customer_ph_number = phonenumber, customer_password = password)
            request.session['customer_id'] = customer.customer_id 
            print(customer.customer_id )
            print(customer.customer_name)
            messages.info(request, "Login Successfully.")
            return redirect("customer_offerzone")

        except:
            messages.error(request,"Invalid Phonenumber or Password")

            print("error")

    return render(request,'customer/customer-login.html')   


def customer_offerzone(request):
    a=MenuDetialsModel.objects.all()
    return render(request,'customer/customer-offerzone.html',{'food' :a})   

def customer_food_menu(request):
    
    b=MenuDetialsModel.objects.filter(item_type = "Breakfast")
    print(b,'break')
    l=MenuDetialsModel.objects.filter(item_type = "Launch")
    print(l,'lunc')
    d=MenuDetialsModel.objects.filter(item_type = "Dinner")
    print(d,'dinn')
    all = CustomerFeedBackModel.objects.all().count()
    print(all,'kkkk')
    taste_vpost1 = CustomerFeedBackModel.objects.filter(taste_feedback=5).count()
    taste_vpost = round((taste_vpost1/all)*100)
    taste_post1 = CustomerFeedBackModel.objects.filter(taste_feedback=4).count()
    taste_post = round((taste_post1/all)*100)
    taste_neg1 = CustomerFeedBackModel.objects.filter(taste_feedback=2).count()
    taste_neg = round((taste_neg1/all)*100)
    taste_vneg1 = CustomerFeedBackModel.objects.filter(taste_feedback=1).count()
    taste_vneg = round((taste_vneg1/all)*100)

    taste_new1 = CustomerFeedBackModel.objects.filter(taste_feedback=3).count()
    taste_new = 100 - taste_vpost - taste_post - taste_neg - taste_vneg

    price_vpost1 = CustomerFeedBackModel.objects.filter(price_feedback=5).count()
    price_vpost = round((price_vpost1/all)*100)
    price_post1 = CustomerFeedBackModel.objects.filter(price_feedback=4).count()
    price_post = round((price_post1/all)*100)
    price_neg1 = CustomerFeedBackModel.objects.filter(price_feedback=2).count()
    price_neg = round((price_neg1/all)*100)
    price_vneg1 = CustomerFeedBackModel.objects.filter(price_feedback=1).count()
    price_vneg = round((price_vneg1/all)*100)
    price_new1 = CustomerFeedBackModel.objects.filter(price_feedback=3).count()
    price_new = 100 - price_vpost - price_post - price_neg - price_vneg


    

    service_vpost1 = CustomerFeedBackModel.objects.filter(service_feedback=5).count()
    service_vpost = round((service_vpost1/all)*100)
    service_post1 = CustomerFeedBackModel.objects.filter(service_feedback=4).count()
    service_post = round((service_post1/all)*100)
    service_neg1 = CustomerFeedBackModel.objects.filter(service_feedback=2).count()
    service_neg = round((service_neg1/all)*100)
    service_vneg1 = CustomerFeedBackModel.objects.filter(service_feedback=1).count()
    service_vneg = round((service_vneg1/all)*100)
    service_new1 = CustomerFeedBackModel.objects.filter(service_feedback=3).count()
    service_new = 100 - service_vpost - service_post - service_neg - service_vneg




    



    return render(request,'customer/customer-food-menu.html',{
        'breakfast' :b,
        'lunch' :l,
        'dinner' :d,
        'taste_post':taste_post,
        'taste_neg':taste_neg,
        'taste_vpost':taste_vpost,
        'taste_vneg':taste_vneg,
        'taste_new':taste_new,
        'price_post':price_post,
        'price_neg':price_neg,
        'price_vpost':price_vpost,
        'price_vneg':price_vneg,
        'price_new':price_new,
        'service_post':service_post,
        'service_neg':service_neg,
        'service_vpost':service_vpost,
        'service_vneg':service_vneg,
        'service_new':service_new,
        

        
        }) 





# def customer_pichart(request):
#     taste = CustomerFeedBackModel.objects.all().aggregate(Avg('taste_feedback'))
#     price = CustomerFeedBackModel.objects.all().aggregate(Avg('price_feedback'))
#     service = CustomerFeedBackModel.objects.all().aggregate(Avg('service_feedback'))
    

#     return render(request,'customer/customer-food-menu.html')   




                        