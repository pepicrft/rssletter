defmodule RssletterWeb.Authentication do
  @moduledoc ~S"""
  This module provides functionality to authenticate users.
  """
  import Plug.Conn

  @current_user_key :current_user
  @user_token_session_key :current_user
  @max_age 60 * 60 * 24 * 60
  @remember_me_cookie "_rssletter_user_remember_me"
  # @remember_me_options [sign: true, max_age: @max_age, same_site: "Lax"]

  def authenticated?(%Plug.Conn{} = conn) do
    not is_nil(current_user(conn))
  end

  def current_user(%Plug.Conn{} = conn) do
    conn.assigns[@current_user_key]
  end

  def fetch_current_user(conn, _opts) do
    {_user_token, conn} = ensure_token_in_session(conn)
    # user = user_token && Accounts.get_user_by_session_token(user_token)
    assign(conn, :current_user, nil)
  end

  defp ensure_token_in_session(%Plug.Conn{} = conn) do
    if token = conn |> get_session(@user_token_session_key) do
      {token, conn}
    else
      conn = fetch_cookies(conn, signed: [@remember_me_cookie])

      if token = conn.cookies[@remember_me_cookie] do
        {token, put_token_in_session(conn, token)}
      else
        {nil, conn}
      end
    end
  end

  defp put_token_in_session(conn, token) do
    conn
    |> put_session(@user_token_session_key, token)
    |> put_session(:live_socket_id, "users_sessions:#{Base.url_encode64(token)}")
  end
end
