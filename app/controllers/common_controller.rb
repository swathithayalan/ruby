class CommonController < ApplicationController

    def getDocumentTypes
        documenttypes = DocumentType.all
        render json: { status: 'Success', message: 'Load Document Types', data: documenttypes}, status: :ok                  
    end

    def getServices
        services = Service.all
        render json: { status: 'Success', message: 'Load Services', data: services}, status: :ok                  
    end

    def getRoles
        roles = Role.all
        render json: { status: 'Success', message: 'Load Roles', data: roles}, status: :ok                  
    end

    def getCountries
        countries = Country.all
        render json: { status: 'Success', message: 'Load Countries', data: countries}, status: :ok                  
    end

    def getStates
        states = State.where("countryId = ?", params[:id])
        render json: { status: 'Success', message: 'Load States by CountryID', data: states}, status: :ok                  
    end

end
