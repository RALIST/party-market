class Api::V1::EventsController < ApplicationController

  def index
    events = Event.all

    paginate json: events.includes(images: { file_attachment: :blob }, event_users: { user: { avatar_attachment: :blob } }),
             include: '**',
             each_serializer: Api::V1::EventSerializer,
             status: :ok
  end

  def show
    render json: event, status: :ok
  end

  def create
    new_event = Event.create!(event_params)
    new_event.event_users.create!(user: current_user, role: 'creator')
    render json: new_event, status: :created
  end

  def destroy
    event.hide!
    head :ok
  end

  private

  def event
    @event ||= Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
