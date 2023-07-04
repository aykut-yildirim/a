import fnmatch

from flask import Flask, render_template, request

from flask_restful import Api, Resource
from mynet_scraper.scraper import MynetScraper

# from dataclasses import asdict
# import requests

app = Flask(__name__)
api = Api(app)
base_url = "127.0.0.1:5000"

scraper = MynetScraper()
link_list = scraper.get_link()


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        share_code = request.form.get("share_code")
        for link in link_list:
            if fnmatch.fnmatch(
                link, "*" + "hisseler/" + "*" + share_code.lower() + "*"
            ):
                return render_template(
                    "index.html", profile=scraper.get_stocks_name(link)
                )

    else:
        return render_template("index.html")


@app.route(
    "/<string:name>",
)
def anaSayfa(name):
    name = name.split()
    print(name)
    share = []
    for link in link_list:
        if fnmatch.fnmatch(link, "*" + "hisseler/" + "*" + name[0].lower() + "*"):
            share.append(scraper.get_stocks_name(link).code)
            share.append(scraper.get_stocks_name(link).name)
    return share


class Dict(Resource):
    def get(self):
        return {"key": "value"}


api.add_resource(Dict, "/dict")
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)