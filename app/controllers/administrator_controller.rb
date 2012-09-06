class AdministratorController < ApplicationController
  #skip_before_filter  :verify_authenticity_token
  def admin_signup
    if request.post?
      @admin=Administrator.new(params[:admin])
      @admin.user_type="administrator"
      respond_to do|format|
        if @admin.save
          format.html{render "admin_login"}
          format.json{render :json=>"created"}
          format.xml{render :xml=>@admin}
        else
          format.html{render "admin_signup"}
          format.json{render :json=>nil}
          format.xml{render :xml=>nil}
        end
      end
    end
  end


  def admin_login
    if request.post?
      @admin=User.authenticate(params[:login],params[:password])
      respond_to do|format|
        if !@admin.nil?
          if @admin.user_type=="administrator"
            @admin=Administrator.find_by_name(params[:login])
            format.html{session[:administrator]=@admin; redirect_to :action=> "admin_home"}
            format.json{render json=>@admin}
            format.xml{render xml=>@admin}
          else
            @admin=Customer.find_by_name(params[:login])
            format.html{session[:customer]=@admin; redirect_to :action=> "customer_home"}
            format.json{render json=>@admin}
            format.xml{render xml=>@admin}
          end

        else
          format.html{render :text=>'incorrect user name or password',:layout=>true}
          format.json{render json=>nil}
          format.xml{render xml=>nil}
        end
      end
    end
  end


  def admin_home

    @admin=@admin=Administrator.find(session[:administrator].id)
    @admin_content={}

    @admin_content["logo"]= @admin.logo
    @admin_content["gallery"]= @admin.galleries
    @admin_content["contact"]= @admin.contact
    @admin_content["item"]={}
    @admin.categories.collect { |c| @admin_content["item"][c]=c.items }

  end

  def add_category
    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
      else
        @admin=nil
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else
      
          @category=Category.new(params[:category])
          @category.admin=@admin
     
          if @category.save
            format.html{redirect_to :action=>"admin_home"}
            #format.json{render json=>"created"}
            format.json {render :json=>"created", :status=>:created }
            format.xml{render :xml=>@category}
          else
            format.html{render :text=>"category not sucessfully added"}
            #format.json{render json=>"created"}
            format.json {render :json=>nil, :status=>:created }
            format.xml{render :xml=>nil}

          end

        end
      end
    end
  end


  def add_item

    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
      else
        @admin=nil
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else
          @cat=Category.find_by_name(params[:category_name])
          if !@cat.nil?
            @item=Item.new(params[:item])
            @item.category_id=@cat.id
            @item.admin=@admin
            @item.save
            format.html{redirect_to :action=>"admin_home"}
            format.json{render :json=>"item sucessfully added"}
            format.xml{render :xml=>"item sucessfully added"}
          else
            format.html{render :text=>"specified category not found", :layout=>true}
            format.json{render :json=>"specified category not found"}
            format.xml{render :xml=>"specified category not found"}
          end
        end
    
      end
    end
  end


  def add_gallery
    
    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
      else
        @admin=nil
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else
          params[:gallery].each do |k,v|
            @gallery=Gallery.new()
            @gallery.photo=v
            @gallery.picture_type="gallery"
            @gallery.admin=@admin
            if @gallery.save
              format.html{redirect_to :action=>"add_gallery"}
              format.json {render :json=>@gallery }
              format.xml{render :xml=>@gallery}
            else
              format.html{render :text=>"picture not added to gallery"}
              format.json {render :json=>nil}
              format.xml{render :xml=>nil}
            end
          end
          
          #

          #@gallery=Gallery.new(params[:gallery])
          #          @gallery.picture_type="gallery"
          #          @gallery.admin=@admin
          #          if @gallery.save
          #            format.html{redirect_to :action=>"admin_home"}
          #            format.json {render :json=>@gallery }
          #            format.xml{render :xml=>@gallery}
          #          else
          #            format.html{render :text=>"picture not added to gallery"}
          #            format.json {render :json=>nil}
          #            format.xml{render :xml=>nil}
          #          end
        end
        #redirect_to :action=>"admin_home"
      end
    else
      @admin=@admin=Administrator.find(session[:administrator].id)
      @admin_content={}
      @admin_content["gallery"]= @admin.galleries
    end



  end


  def add_logo
    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
      else
        @admin=nil
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else
          @logo1=Logo.new(params[:logo])
          @logo1.picture_type="logo"
          @logo1.admin=@admin
          if @logo1.save
            format.html{redirect_to :action=>"admin_home"}
            format.json {render :json=>@logo1 }
            format.xml{render :xml=>@logo1}
          else
            format.html{render :text=>"logo not changed"}
            format.json {render :json=>nil}
            format.xml{render :xml=>nil}
          end
        end
      end
    end
  end


  def add_contact
    if request.post?
      if request.post?
        if params.include?"administrator"
          @admin=params[:administrator]
        elsif !session[:administrator].nil?
          @admin=session[:administrator].name
        else
          @admin=nil
        end
        respond_to do|format|
          if @admin.nil?
            format.html{render :text=>"administrator login need", :layout=>true}
            #format.json{render json=>"created"}
            format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
            format.xml{render :xml=>"administrator name not specifed or not correct one"}
          else
            @contact=Contact.new(params[:contact])
            @contact.admin=@admin
            if @contact.save
              format.html{redirect_to :action=>"admin_home"}
              format.json {render :json=>@contact }
              format.xml{render :xml=>@contact}
            else
              format.html{render :text=>"contact not changed"}
              format.json {render :json=>nil}
              format.xml{render :xml=>nil}
            end
          end
        end
      end
    end
  end


  def add_tax
    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
      else
        @admin=nil
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else

          @tax=Tax.new(params[:tax])
          @tax.admin=@admin

          if tax.save
            format.html{redirect_to :action=>"admin_home"}
            format.json {render :json=>@tax }
            format.xml{render :xml=>@tax}
          else
            format.html{render :text=>"tax not changed"}
            format.json {render :json=>nil}
            format.xml{render :xml=>nil}
          end
        end
      end
    end
  end


  def add_customer
    if request.post?
      if params.include?"administrator"
        @admin=params[:administrator]
      elsif !session[:administrator].nil?
        @admin=session[:administrator].name
        puts "===================+++++++++++++++++++================"
        puts @admin
      else
        @admin=nil
        puts "===================+++++++++++++++++++================"
        puts @admin
      end
      respond_to do|format|
        if @admin.nil?
          format.html{render :text=>"administrator login need", :layout=>true}
          #format.json{render json=>"created"}
          format.json {render :json=>"administrator name not specifed or not correct one", :status=>:created }
          format.xml{render :xml=>"administrator name not specifed or not correct one"}
        else
          @customer=Customer.new(params[:customer])
          @customer.user_type="customer"
          @customer.admin=@admin
          if @customer.save
            format.html{redirect_to :action=>"admin_home"}
            format.json {render :json=>@customer }
            format.xml{render :xml=>@customer}
          else
            format.html{render :text=>"customer not changed"}
            format.json {render :json=>nil}
            format.xml{render :xml=>nil}
          end
        end
      end
    end
  end

  def customer_home
    @admin=Administrator.find(session[:customer].administrator_id)
    @admin_content={}
    
    @admin_content["logo"]= @admin.logo
    @admin_content["gallery"]= @admin.galleries
    @admin_content["contact"]= @admin.contact
    @admin_content["item"]={}
    @admin.categories.collect { |c| @admin_content["item"][c]=c.items }
     
    
    #render @admin_content.inspect
  end
  #  def show
  #    @admin = Administrator.new
  #      5.times {@admin.galleries.build}
  #    render "add_gallery"
  #  end

  def admin_signout
    reset_session
    render "admin_login"
  end
end
