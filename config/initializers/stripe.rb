#Stripe.api_key = "idrdONZ8i49kJsbpGdBNASvWPODnWt5Y"
#STRIPE_PUBLIC_KEY = "pk_7DtlTQfj8DvnlEFyB4PYRGxyLRQbA"

if(Rails.env == 'development')
  Stripe.api_key = "WCKnQnkxBy4EU7kDRBPqVIYs1QEVqE2P"   #developer's test account
  STRIPE_PUBLIC_KEY = "pk_ewBOpbLAWwRal9TTsI7AyTkqoCFwd" #developer's test account
elsif(Rails.env == 'staging')
  Stripe.api_key = "WCKnQnkxBy4EU7kDRBPqVIYs1QEVqE2P" #developer's test account
  STRIPE_PUBLIC_KEY = "pk_ewBOpbLAWwRal9TTsI7AyTkqoCFwd" #developer's test account
elsif(Rails.env == 'production')
  Stripe.api_key = "WCKnQnkxBy4EU7kDRBPqVIYs1QEVqE2P" #developer's test account
  STRIPE_PUBLIC_KEY = "pk_ewBOpbLAWwRal9TTsI7AyTkqoCFwd" #developer's test account
end