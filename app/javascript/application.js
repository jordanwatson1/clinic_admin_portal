import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"

import TestController from "./controllers/test_controller"
import TreatmentPlanBuilderController from "./controllers/treatment_plan_builder_controller"

const application = Application.start()

application.register("test", TestController)
application.register("treatment-plan-builder", TreatmentPlanBuilderController)
