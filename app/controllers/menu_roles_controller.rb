class MenuRolesController < ApplicationController
  before_action :set_menu_role, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  before_filter :authenticate_user!
  # GET /menu_roles
  # GET /menu_roles.json
  def index
    @title = "Menu Roles";
    @menu_roles = MenuRole.all
  end

  # GET /menu_roles/1
  # GET /menu_roles/1.json
  def show
    @title = "Menu Roles - Show";
  end

  # GET /menu_roles/new
  def new
    @title = "Menu Roles - New";
    @menu_role = MenuRole.new
  end

  # GET /menu_roles/1/edit
  def edit
    @title = "Menu Roles - Edit";
  end

  # POST /menu_roles
  # POST /menu_roles.json
  def create
    @menu_role = MenuRole.new(menu_role_params)

    respond_to do |format|
      if @menu_role.save
        format.html { redirect_to @menu_role, notice: 'Menu role was successfully created.' }
        format.json { render :show, status: :created, location: @menu_role }
      else
        format.html { render :new }
        format.json { render json: @menu_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_roles/1
  # PATCH/PUT /menu_roles/1.json
  def update
    respond_to do |format|
      if @menu_role.update(menu_role_params)
        format.html { redirect_to @menu_role, notice: 'Menu role was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_role }
      else
        format.html { render :edit }
        format.json { render json: @menu_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_roles/1
  # DELETE /menu_roles/1.json
  def destroy
    @menu_role.destroy
    respond_to do |format|
      format.html { redirect_to menu_roles_url, notice: 'Menu role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_role
      @menu_role = MenuRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_role_params
      params.require(:menu_role).permit(:name, :icon, :link, :role_id, :position)
    end
end
