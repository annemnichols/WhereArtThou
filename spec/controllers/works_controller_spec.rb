require 'rails_helper'

describe WorksController do
  
  describe 'GET #show' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
      @work = FactoryGirl.create(:work)
    end

    it 'creates an instance variable @work with the intended work' do
      get :show, {artist_id: 999, id: @work.id}
      expect(assigns(:work)).to eq(@work)
    end

    it 'renders the :show view' do
      get :show, {artist_id: 999, id: @work.id}
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'creates an instace variable @works' do
      get :index
      expect(assigns(:works)).to_not be_nil
    end

    it 'creates an instace variable @artists' do
      get :index
      expect(assigns(:artists)).to_not be_nil
    end

    it 'creates an instace variable @venues' do
      get :index
      expect(assigns(:venues)).to_not be_nil
    end

    it 'creates an instace variable @events' do
      get :index
      expect(assigns(:events)).to_not be_nil
    end

    it 'creates an instace variable @users' do
      get :index
      expect(assigns(:users)).to_not be_nil
    end
  end

  # describe 'GET #get_work_data' do
  #   before :each do
  #     @artwork = FactoryGirl.create(:work)
  #   end

  #   it 'executes get_work_data.js.erb' do
  #     xhr :get, :get_work_data, data: {"work": @artwork.id} #{id: @artwork.id}
  #     expect(response).to render_template :get_work_data
  #   end
  #   it 'creates an instace variable @work'
  #   it 'creates an instace variable @artist'
  # end

  describe 'GET #new' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
    end

    it 'renders the new view' do
      get :new, {artist_id: @artist999.id}
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
    end

    context 'with valid input' do
      it 'creates a new work' do 
        expect { 
          post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:work)}
          }.to change(Work,:count).by(1) 
      end

      it 'redirects to artist page after new work is created' do
        post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:work)}
        expect(response).to redirect_to @artist999
      end
    end

    context 'with invalid input' do
      it 'does not save the new work' do
        expect { 
          post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:invalid_work)}
          }.to_not change(Work, :count)
      end

      it 're-renders the "new" page' do
        post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:invalid_work)}
        expect(response).to render_template :new, {artist_id: @artist999.id}
      end
    end
  end

  describe 'GET #edit'
    it 'renders the edit view'

  describe 'PUT update'
    context 'valid input'
      it 'located the requested @work'
      it 'changes @work attributes'
      it 'redirects to the updated work'
    context 'invalid input'
      it 'located the requested @work'
      it 'does not change @work attributes'
      it 're-renders the edit page'

  describe 'DELETE destroy'
    it 'deletes the work'
    it 'redirects to the artist page'

end