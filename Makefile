include config.mk

.PHONY: app-deploy
app-deploy:
	gcloud app deploy --project=$(PROJECT)

.PHONY: iap-enable
iap-enable:
	gcloud iap web enable \
		--resource-type=app-engine \
		--oauth2-client-id=$(OAUTH_CLIENT_ID) \
		--oauth2-client-secret=$(OAUTH_CLIENT_SECRET)

.PHONY: iap-disable
iap-disable:
	gcloud iap web disable --resource-type=app-engine

.PHONY: textlint
textlint:
	npx textlint src/**
