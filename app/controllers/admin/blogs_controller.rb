class Admin::BlogsController < AdminController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @q = Blog.includes(:student).ransack(params[:q])
    @blogs = @q.result(distinct: true).page(params[:page])
  end

  def new
    @blog = Blog.new
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blog_path(@blog), notice: "blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to admin_blog_path(@blog), notice: "blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to admin_blogs_path, notice: "blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :student_id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end