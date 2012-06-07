#Stripe.api_key = "idrdONZ8i49kJsbpGdBNASvWPODnWt5Y"
#STRIPE_PUBLIC_KEY = "pk_7DtlTQfj8DvnlEFyB4PYRGxyLRQbA"

if(Rails.env == 'development')
  Stripe.api_key = "cBFc9xFhaD2oMvznZiN64TlLIOhdHkxv"   #developer's test account
  STRIPE_PUBLIC_KEY = "pk_jqn36GexB4PUaRNxT5edKBXjWc624" #developer's test account
elsif(Rails.env == 'staging')
  Stripe.api_key = "cBFc9xFhaD2oMvznZiN64TlLIOhdHkxv" #developer's test account
  STRIPE_PUBLIC_KEY = "pk_jqn36GexB4PUaRNxT5edKBXjWc624" #developer's test account
elsif(Rails.env == 'production')
  Stripe.api_key = "cBFc9xFhaD2oMvznZiN64TlLIOhdHkxv" #developer's test account
  STRIPE_PUBLIC_KEY = "pk_jqn36GexB4PUaRNxT5edKBXjWc624" #developer's test account
end