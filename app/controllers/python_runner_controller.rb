class PythonRunnerController < ApplicationController
  def index
    unless params[:out].nil?
      @output = params[:out].lines   
    else
      @output = []
    end

    unless params[:code].nil?
      @code = params[:code]
    else
      @code = ""
    end
  end

  def run_python_code(code)
    @code = code

    File.open("/home/michael/MyWork/Programming/Ruby/InfoManager/Scripts/runner.py", 'w') {|f| f.write("#!/usr/bin/env python\n\n" + @code) }

    @output = `/home/michael/MyWork/Programming/Ruby/InfoManager/Scripts/runner.py`

    redirect_to python_runner_index_path :out => @output, :code => @code
  end

  def save_file
    if params[:selected] == "Save"
      @code = params[:code]
      @current = Time.now
      @timedate = @current.month.to_s + "-" + @current.day.to_s + "-" + @current.year.to_s + "T" + @current.hour.to_s + "-" + @current.min.to_s
      @file = "/home/michael/MyWork/Programming/Ruby/InfoManager/Scripts/" + params[:file_name] + "-" + @timedate + ".py"

      File.open(@file, 'w') {|f| f.write("#!/usr/bin/env python\n\n" + @code) }    
   
      redirect_to python_runner_index_path, :code => @code, :notice => "Saved to " + params[:file_name] + "-" + @timedate + ".py"
    elsif params[:selected] == "Run"
      run_python_code params[:code]
    end
  end
end
