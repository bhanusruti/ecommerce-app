  class ProductsController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show, :search]
     
  def index
    if params[:sort]
      @products = Product.order(price: params[:sort])
    elsif params[:discount]
      @products = Product.where("price < ?", 15)
    elsif params[:category_id]
      @products = Category.find_by(id: params[:category_id]).products
    else
      @products = Product.all
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new

  end

  def create
    name = params[:name]
    price = params[:price]
    description = params[:description]
    image_url = params[:image]
    product = Product.new(name: name, price: price, description: description)
    if product.save
      flash[:success] = "Product Created!!!!!"
      # image = Image.new(product_id: product.id, url: image_url)
      # image.save
      redirect_to "/products/#{product.id}"
    else
      flash[:danger] = "Product Not Created!!!!!"
      redirect_to "/products/new"
    end
    
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.description = params[:description]
    product.image = params[:image]
    product.save
    flash[:success] = "Product Updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Product Deleted!!!"
    redirect_to "/products"
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%")
    render :index
  end

  end
