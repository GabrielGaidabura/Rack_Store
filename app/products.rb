class Products
    @@products = []

    attr_reader :name
    attr_reader :full_name
    attr_reader :desc
    attr_reader :price
    attr_reader :img

    def initialize(name, full_name, desc, price, img)
        @name, @full_name, @desc, @price, @img = name, full_name, desc, price, img
    end

    def save
        @@products << self
    end

    def self.count
        @@products.size
    end

    def self.all
        @@products
    end

    def self.purge
        @@products = []
    end

    def self.find (name)
        @@products.detect { |e| e.name == name }
    end

    def self.to_html
        @@products.reduce('') { |list, e| list + e.to_html }
    end

    def to_html
        "<div>
            <p> <a href='#{self.name}'>#{self.full_name} </a></p>
            <p> Price: #{self.price} </p>
            <p> <img src='#{self.img}'> #{self.desc}</p>
        </div>"
    end
  
end

Products.new("SJ4000", "SJ4000 WIFI (Black Edition)", " Matrix: CMOS 1/3\", 12 Mp, Aptina AR0330\n Video resolution: Full HD (1920x1080)\n Lens: F= 2.8\n Viewing angle: 170\n LCD Monitor: 1.5\"", 3099, "img/SJ4000.jpg").save
Products.new("ION", "ION AIR Pro Plus (1010)", " Matrix: 1/2.5\" HD CMOS, 2.2 Mp\n Video resolution: Full HD (1920x1080)\n Lens: type - fixed focus (0.6 m), f/2.8\n Viewing angle: 1080p / 30 fps = 127, 960p / 30 fps = 170, 720p,WVGA / 30, 60 fps = 150\n LCD Monitor: no", 3699, "img/ion_air.jpg").save
Products.new("Panasonic", "Panasonic HC-V250EE-K", " Matrix: BSI 1/5.8, 2.51 Mp\n Video resolution: Full HD (1920x1080)\n Lens: F 1.8 / 4.2, Focus range: 2.06-103 mm\n Zoom : optical: 50x, intelligent Zoom off/on: 62x/90x, digital zoom: 150x/3000x\n LCD Monitor: 2.7\"", 5499, "img/Panasonic.jpg").save
Products.new("Sony", "Sony HDR-AS20 (HDRAS20B.CEN)", " Matrix: Exmor R CMOS type 1/2.3\" (7.77 mm) with backlit\n Video resolution: Full HD (1920x1080)\n Lens: wide-angle (170) professional lens ZEISS Vario-Tessar, F2.8\n Image Stabiliser: Electronic SteadyShot", 4999, "img/Sony.jpg").save
