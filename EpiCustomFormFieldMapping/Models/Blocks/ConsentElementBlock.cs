using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using EPiServer.Core;
using EPiServer.DataAnnotations;
using EPiServer.Forms;
using EPiServer.Forms.Core.Internal;
using EPiServer.Forms.Core.Models.Internal;
using EPiServer.Forms.EditView;
using EPiServer.Forms.EditView.DataAnnotations;
using EPiServer.Forms.Helpers.Internal;
using EPiServer.Forms.Implementation.Elements.BaseClasses;
using EPiServer.Forms.Implementation.Validation;


namespace EpiCustomFormFieldMapping.Models.Blocks
{
    [ContentType(DisplayName = "Consent Form Element", GUID = "be596250-fda6-43ae-af5b-ff17cb647f7a", GroupName = "Custom form elements", Order = 1000)]
    [AvailableValidatorTypes(Include = new[] { typeof(RequiredValidator) })]
    public class ConsentElementBlock : ValidatableElementBlockBase, IElementRequireClientResources, IUIExternalFieldMapping
    {
        [CultureSpecific]
        [Display(Order = 100)]
        public virtual XhtmlString ConsentText { get; set; }

        [CultureSpecific]
        [Display(Order = 110)]
        public virtual string ConsentRequired { get; set; }

        [ScaffoldColumn(false)] public override string Label { get; set; }

        [ScaffoldColumn(false)] public override string Description { get; set; }

        public override string Validators
        {
            get
            {
                var privacyValidator = typeof(ConsentValidator).FullName;
                var validators = this.GetPropertyValue(content => content.Validators);
                if (string.IsNullOrEmpty(validators))
                {
                    return privacyValidator;
                }

                return string.Concat(validators, Constants.RecordSeparator, privacyValidator);
            }

            set
            {
                this.SetPropertyValue(content => content.Validators, value);
            }
        }

        public IEnumerable<Tuple<string, string>> GetExtraResources()
        { 
            return new List<Tuple<string, string>>()
            {
                new Tuple<string, string>("script",  "/Static/js/consent-form-field-validator.js")
            };
        }

        public override object GetSubmittedValue()
        {
            var rawSubmittedData = HttpContext.Current.Request.Form;
            var isJavaScriptSupport = rawSubmittedData.Get(Constants.FormWithJavaScriptSupport);
            if (isJavaScriptSupport == "true") 
            {
                return base.GetSubmittedValue();
            }

            var privacyConsentComponents = rawSubmittedData.GetValues(Content.GetElementName());
            if (privacyConsentComponents == null || privacyConsentComponents.Length < 1)
            {
                return null;
            }

            return privacyConsentComponents[0];
        }

        public virtual object GetFormattedValue()
        { 
            var submittedValue = GetSubmittedValue() as string ?? string.Empty;
            return submittedValue;
        }

        public override ElementInfo GetElementInfo()
        {
            var baseInfo = base.GetElementInfo();
            baseInfo.CustomBinding = true;
            return baseInfo;
        }
    }
    }
