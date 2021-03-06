as yet unclassified
testCancelCustomerSubscription
	| cust dict |
	dict := Dictionary new.
	dict at: 'email' put: 'me@example.com'.
	dict at: 'coupon' put: '10_pct'.
	dict at: 'plan' put: 'small'.
	dict at: 'description' put: 'my name'.
	dict at: 'trial_end' put: (DateAndTime today + 30 days) asUnixTime asString.
	cust := StripeCustomer newFromCard: card with: dict.
	self assert: cust email equals: 'me@example.com'.
	self assert: cust cancelSubscriptionNow	"StripeCustomer instances remove: cust ifAbsent:[] ."