class AppointmentsController < ApplicationController
  
    
    def index
      @appointments = Appointment.all  
    end
      def show
        @appointment = Appointment.find(params[:id])
      end
         def new
            @appointment = Appointment.new
          end
            def edit
              @appointment = Appointment.find(params[:id])
            end
                def create
                  @appointment = Appointment.new(appointment_params)

                  if @appointment.save 
                    redirect_to @appointment ,  notice: "Appointment Created"
                    else
                      render 'new'
                  end    
                end
                    def update
                      @appointment = Appointment.find(params[:id])
                      if @appointment.update(appointment_params)
                       redirect_to @appointment
                        else
                         render "edit"
                     end  
                   end

                      def destroy
                         @appointment = Appointment.find(params[:id])
                         @appointment.destroy
                         redirect_to appointments_path
                      end  
                         private
                         def appointment_params
                            params.require(:appointment).permit(:appointment_date, :physician_id, :patient_id)
                         end



end
