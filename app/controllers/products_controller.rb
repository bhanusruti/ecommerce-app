  class ProductsController < ApplicationController

    def index
      @products = Product.all 
    end

    def show
      # get specific  product
      @product = Product.find_by(id: params[:id])
    end

    def new

    end

    def create
      name = params[:name]
      price = params[:price]
      breed= params[:breed]
      color= params[:color]
       product = Product.new(name: name, price: price, breed: breed, color:color)
       product.save
       flash[:success] = "Product Created!!!!!"
       redirect_to "/products/#{product.id}"
    end

    def edit
      @id = params[:id]
      @product = Product.find_by(id: params[:id])
    end

    def update
      name = params[:name]
      price = params[:price]
      breed= params[:breed]
      color= params[:color]
      @product = Product.find_by(id: params[:id])
      @product.update(name: name, price:price, color: color, breed: breed)
      product.save
      flash[:success] = "Product Updated"
      redirect_to "/products/#{product.id}"
    end

    def destroy
      product = Product.find_by(id: params[:id])
      product.delete
      flash[:warning] = "Product Deleted"
      redirect_to "/products"
    end

  end
