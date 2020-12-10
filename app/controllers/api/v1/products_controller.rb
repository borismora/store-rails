class Api::V1::ProductsController < ApiController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  
    # GET /api/v1/products
    def index
      products = Product.order('id_product DESC');
      render json: products;
    end
  
    # GET /api/v1/products/1
    def show
      render json: product;
    end
  
    # GET /api/v1/products/new
    #def new
    #  api_v1_product = Product.new
    #end
  
    # GET /api/v1/products/1/edit
    #def edit
    #end
  
    # POST /api/v1/products
    def create
      product = Product.new(product_params);
  
      if product.save 
        render json: {response: "product successfully stored", data: product},status: :ok
      else 
        render json: {response: "error storing product", data: product.errors},status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/products/1
    # PATCH/PUT /api/v1/products/1.json
    def update
        if product.update_attributes(product_params)
            render json: {response: "product successfully updated", data: product},status: :ok
        else
            render json: {response: "error updating product", data: product.errors},status: :unprocessable_entity
        end
    end
  
    # DELETE /api/v1/products/1
    # DELETE /api/v1/products/1.json
    def destroy
        product.destroy
        render json: {response: "product deleted", data: product},status: :ok
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      product = Product.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:sku, :name, :price, :typee)
    end
  end
  