class LessonsController < ApplicationController
  
  def index 

    if params[:lesson_name].present? || params[:teacher_name].present?
      @lessons = Lesson.where("teacher_name LIKE ?", "%#{params[:teacher_name]}%").where("lesson_name LIKE ?", "%#{params[:lesson_name]}%").order(:lesson_name)
    else
      @error_message = "検索ワードを入力してください"
      flash[:notice] = "検索ワードを入力してください"
      # render("search/top")
      redirect_to("/")
      
    end
  end

  def add
    @lesson=Lesson.new
  end

  def create
    @lesson = Lesson.new(
      lesson_name: params[:lesson_name],
      teacher_name: params[:teacher_name],
      teacher_room: params[:teacher_room],
      TA_room: params[:TA_room]
    )
    if @lesson.save
      flash[:notice] = "講義を登録しました。"
      redirect_to("/")
    else
      render("lessons/add")
    end
  end

  def search
    redirect_to("/lessons/index")
  end

  def show
    @lesson=Lesson.find_by(id: params[:id])
    @corrects_count=Correct.where(lesson_id: params[:id]).count
  end

  def edit
    @lesson=Lesson.find_by(id: params[:id])
    corrects=Correct.where(lesson_id: params[:id])
    corrects.each do |correct|
      correct.destroy
    end
  end

  def update
    @lesson=Lesson.find_by(id: params[:id])
    @lesson.lesson_name =params[:lesson_name]
    @lesson.teacher_name =params[:teacher_name]
    @lesson.teacher_room =params[:teacher_room]
    @lesson.TA_room =params[:TA_room]
    @lesson.save

    redirect_to("/lessons/#{@lesson.id}")
  end

  def destroy
    lesson=Lesson.find_by(id: params[:id])
    lesson.destroy
    flash[:notice] = "講義を削除しました。"
    redirect_to("/")
  end

  
end
