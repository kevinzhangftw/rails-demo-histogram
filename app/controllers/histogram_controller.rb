class HistogramController < ApplicationController

  def show
    set_course
    render template: "histogram.html.erb",
      :locals => { grades_counts: grades_counts, grades_bounds:grades_bounds}
  end

  def submitbounds
    render json: {"submit": "grade bounds "}
  end

  def grades_bounds
    #get grade bounds from view, update database lettergrade column
    return "SOME BOUNDs"
  end

  def grades_counts
    grades = @course.enrolls.collect(&:lettergrade)
    counts = Hash.new 0
    grades.each do |grade|
      counts[grade] += 1
    end

    return counts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      if params[:id]
        @course = Course.find(params[:id])
      else
        @course = Course.first
      end
    end
end
