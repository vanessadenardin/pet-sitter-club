class ProfilesController < ApplicationController

    def show
        @profile = Profile.all
    end
end
