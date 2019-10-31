# Create random users
for i in 1..10
    name = Faker::Twitter.screen_name
    user = User.create(
        username: name,
        email: Faker::Internet.free_email(name: name),
        password: Faker::Internet.password(min_length: 6, max_length: 10, mix_case: true),
        bio: Faker::Quote.matz,
        skin_type: rand(0..3) #(enum: 0 Oily, 1 Normal, 2 Dry, 3 Combo)
    )

    puts "created #{i} user - #{user.errors.messages}"
end

# Create random locations
for i in 1..5
    while true
        postcode = rand(2000..7799)
        response = HTTParty.get("http://v0.postcodeapi.com.au/suburbs/#{postcode}.json")
        if response.parsed_response.length > 0
            break
        end
    end 

    response = response.parsed_response[0]
       location = Location.create(
        suburb: response["name"],
        postcode: response["postcode"],
        state: response["state"]["abbreviation"]
    )

    puts "created #{i} location - #{location.errors.messages}"
end

# category: integer (enum: 0 face, 1 eyes, 2 lips, 3 accessories)
listings = [
    { title: "Colourpop lip liner - brand new", brand: "colourpop", description: "Lippie Pencil A long-wearing and high-intensity lip pencil that glides on easily and prevents feathering. Many of our Lippie Stix have a coordinating Lippie Pencil designed to compliment it perfectly, but feel free to mix and match!", category: 2 }, #1048
    { title: "Glossier Stretch Concealer - brought back from States. Suitable for people with dark skin", brand: "Glossier", description: "A traditional concealer sets to a stiff, flat, dry finish—a dead giveaway that you’re wearing it. Ours is a new type of concealer with elastic micro waxes that move with your face instead of caking on top of it, and nourishing oils that give a dewy, glowing finish. The buildable formula covers everything from dark circles to redness and blemishes. In five shades painstakingly developed to enhance, brighten, and—most importantly—completely disappear into the widest range of skin tones.", category: 0 }, #1004
    { title: "Skinny Mascara from NYX", brand: "nyx", description: "Our ultra-skinny mascara brush is perfect for coating hard to reach lashes from root to tip even along the bottom lash line! Finally the smallest, thinnest lashes can get extra special attention too. The water resistant formula and micro brush work together to create the appearance of long beautifully defined lashes.", category: 1 }, #992
    { title: "Petal 55 Brush Black OS", brand: "shu uemura", description: "Designed to be used with shu uemura's Petal Skin Fluid Foundation, this Petal Oval Brush is designed with ultra dense synthetic hairs which disperses the foundation free of streaks.", category: 3 },
    { title: "Couture Colour Wardrobe palette", brand: "dior", description: "Directly inspired by runway shows, the Couture Colour Wardrobe palette teams fresh and natural colours with vibrant and sophisticated shades to create countless custom makeup looks to suit any moment.", category: 1}, #697
    { title: "24 Hour CC Spot Concealer - Used. Good condition!", brand: "smashbox", description: "We created this 24-hour, waterproof concealer in our L.A. photo studio to instantly cover dark spots, sun spots and post-acne marks while fading the look of them in as little as 4 weeks. You’re basically concealing and treating all at once, which means imperfections have met their match. Dab on this first-of-its-kind cover-up strategically, then get ready for your big reveal! 24-hour wear thanks to Photoset Polymers created with medical-grade liquid bandage technology that bends and adheres to humidity-resistant", category: 0}, #551
    { title: "Physicians Formula Organic Wear 100% Natural Origin Bronzer", brand: "flavour", description: "Physicians Formula Organic Wear 100% Natural Origin Bronzer is made of the finest Italian powder which delivers a buildable natural tan glow. Two shades blend together for the most natural finish. A 100% natural origin bronzer, formulated with 15% certified organic ingredients, including jojoba seed oil and corn starch to moisturize and mattify the skin.", category: 0}, #484
    { title: "Colour Riche Extraordinaire Lip Colour", brand: "l'oreal", description: "Transform lips from ordinary to extraordinary. Colour is richer, lip surface is smoother and shine is magnified. Formulated with precious micro-oils and rich colour pigments, Extraordinaire provides the ideal balance of colour and care for perfect lips. The unique soft-touch applicator allows for a silky-smooth, gliding application. Directions: Use the wand to apply starting in the centre of your upper lip. Work from the centre to outer edges of your lips, following the contour of your mouth. Then glide across the entire bottom lip.", category: 2 }, #84
    { title: "Stila La Quill Eye Liner Brush", brand: "stila", description: "Stila La Quill Eye Liner Brush is a coveted selection of Stila’s best-selling products exclusively handpicked by Stila's very own lead makeup artist, Sarah Lucero. Inspired by Sarah Lucero's work on fashion runways, Stila's artistry proven makeup performs as promised. Designed to dispense liquid eye liner evenly and precisely in a thin or bold line Brush acts like a calligraphy pen, depositing the formula effortlessly for chic precise lines La Quill works best with stila long-wearing liquid liner but may also be used with other types of eyeliners.", category: 3} #224
]



# Create random makeup listing
    for element in listings
        listing = Listing.create(
            title:  element[:title],
            brand: element[:brand],
            description: element[:description],
            category: element[:category],
            price: rand(5..200),
            user_id: rand(1..10),
            location_id: rand(1..5)
        )

        temp_listing_pic = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
        listing.pic.attach(io: temp_listing_pic, filename: File.basename(temp_listing_pic.path))
    
        puts "created makeup #{listing.brand} - #{listing.errors.messages}"
    end





