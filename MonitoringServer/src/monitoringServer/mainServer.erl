%%%-------------------------------------------------------------------
%%% @author bruno
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. jan. 2023 05:03
%%%-------------------------------------------------------------------
-module(mainServer).
-author("bruno").

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3]).

-define(SERVER, ?MODULE).

-record(mainServer_state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc Spawns the server and registers the local name (unique)
-spec(start_link() ->
  {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
%% @doc Initializes the server
-spec(init(Args :: term()) ->
  {ok, State :: #mainServer_state{}} | {ok, State :: #mainServer_state{}, timeout() | hibernate} |
  {stop, Reason :: term()} | ignore).
init([]) ->
  {ok, #mainServer_state{}}.

%% @private
%% @doc Handling call messages
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: #mainServer_state{}) ->
  {reply, Reply :: term(), NewState :: #mainServer_state{}} |
  {reply, Reply :: term(), NewState :: #mainServer_state{}, timeout() | hibernate} |
  {noreply, NewState :: #mainServer_state{}} |
  {noreply, NewState :: #mainServer_state{}, timeout() | hibernate} |
  {stop, Reason :: term(), Reply :: term(), NewState :: #mainServer_state{}} |
  {stop, Reason :: term(), NewState :: #mainServer_state{}}).
handle_call(_Request, _From, State = #mainServer_state{}) ->
  {reply, ok, State}.

%% @private
%% @doc Handling cast messages
-spec(handle_cast(Request :: term(), State :: #mainServer_state{}) ->
  {noreply, NewState :: #mainServer_state{}} |
  {noreply, NewState :: #mainServer_state{}, timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: #mainServer_state{}}).
handle_cast(_Request, State = #mainServer_state{}) ->
  {noreply, State}.

%% @private
%% @doc Handling all non call/cast messages
-spec(handle_info(Info :: timeout() | term(), State :: #mainServer_state{}) ->
  {noreply, NewState :: #mainServer_state{}} |
  {noreply, NewState :: #mainServer_state{}, timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: #mainServer_state{}}).
handle_info(_Info, State = #mainServer_state{}) ->
  {noreply, State}.

%% @private
%% @doc This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: #mainServer_state{}) -> term()).
terminate(_Reason, _State = #mainServer_state{}) ->
  ok.

%% @private
%% @doc Convert process state when code is changed
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #mainServer_state{},
    Extra :: term()) ->
  {ok, NewState :: #mainServer_state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State = #mainServer_state{}, _Extra) ->
  {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
