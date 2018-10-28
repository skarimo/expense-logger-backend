class UsersController < ApplicationController
skip_before_action :authenticate_request, only: %i[login register]

  def login
    authenticate(params["email"], params["password"])
  end

  def show
    @user = User.find(params[:id])
    # @bill_shares = []
    # @bill_shares.push(BillShare.all.find_by(user_id: params[:id]))
    render json: @user
  end

  def register
    @user = User.create(user_params)
   if @user.save
    response = { message: 'User created successfully'}
    render json: response, status: :created
   else
    render json: @user.errors, status: :bad
   end
  end

  def test
    @user = JsonWebToken.decode(request.headers["Authorization"])
    render json: {
          user: @user
        }
  end

  def show_bill_shares
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    if @friendship == nil
      @friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
    end
    render json: @friendship.bill_shares
  end

  def update_bill_shares
    @bill_share = BillShare.find(params[:bill_share])
    amount = @bill_share.amount
    debugger
    amount += (params[:amount_to_add]).to_f
    @bill_share.update(amount: amount)
    render json: @bill_share
  end

  def friend_request
    @user = User.find(params[:id])
    @friend = User.find_by(username: params[:username])

    if (@friend != nil) && (@friend.id != params[:id]) && (!@user.friends.include?(@friend) && (!@friend.pending.include?(@user)))
      friendship = Friendship.create(user_id: params[:id], friend_id: @friend.id)
      render json: {id: @friend.id,first_name: @friend.first_name,last_name: @friend.last_name, username: @friend.username, email: @friend.email}
    elsif @friend.pending.include?(@user)
      render :json => { :errors => "Already Requested" }, :status => 400
    else
       render :json => { :errors => "Invalid username" }, :status => 400
    end
  end

  def accept_request
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @user = User.find(params[:user_id])
    if @friendship == nil
      @friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
    end
    @friendship.update(accepted: true)
    @bill1 = BillShare.create(user_id: params[:id], friendship_id: @friendship.id, amount: 0)
    @bill2 = BillShare.create(user_id: params[:friend_id], friendship_id: @friendship.id, amount: 0)
    render json: { friends:@user.friends, pending: @user.pending }
  end

  def reject_request
    @user = User.find(params[:user_id])
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    if @friendship == nil
      @friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
    end
    @friendship.bill_shares.destroy
    @friendship.destroy
    render json: {pending: @user.requested_friendships}
  end


  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)
    if command.success?
      @user = JsonWebToken.decode(command.result)
      render json: {
        access_token: command.result,
        message: 'Login Successful',
        user: @user
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end


  def user_params
    params.permit(:username, :email, :password, :first_name, :last_name, :category_id)
  end

  def bill_share_params
    params.permit(:user_id, :friend_id)
  end

  def token_params
    params.permit(:token)
  end

end
