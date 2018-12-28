if (typeof $$epiforms !== 'undefined') {
    (function($) {
        var originalGetCustomElementValue = epi.EPiServer.Forms.Extension.getCustomElementValue;
        var privacyConsentValidate = function(fieldName, fieldValue, validatorMetaData) {
            if ($("div[data-epiforms-element-name='" + fieldName + "']").hasClass("ValidationRequired") === true) {
                if (fieldValue.length > 0) {
                    return { isValid: true };
                } else {
                    return { isValid: false, message: validatorMetaData.model.message };
                }
            }
            return { isValid: true };

        };

        $.extend(true,
            epi.EPiServer.Forms,
            {
                Validators: {
                    "EpiCustomFormFieldMapping.Models.Blocks.ConsentValidator":
                        privacyConsentValidate
                },
                CustomBindingElements: {
                    "EpiCustomFormFieldMapping.Models.Blocks.ConsentElementBlock": function(elementInfo,
                        val) {
                        var privacyAgreed = JSON.parse(val);
                        return privacyAgreed.agreed;
                    }
                },
                Extension: {
                    getCustomElementValue: function($element) {
                        if ($element.hasClass("Form_Privacy")) {
                            var $input = $('.FormChoice__Input', $element);
                            return $input.Value;
                        }
                        // if current element is not our job, let others process
                        return originalGetCustomElementValue.apply(this, [$element]);
                    }
                }

            });
    })($$epiforms || $);
};