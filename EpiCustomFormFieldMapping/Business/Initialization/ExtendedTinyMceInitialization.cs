using EpiCustomFormFieldMapping.Models.Blocks;
using EpiCustomFormFieldMapping.Models.Pages;
using EPiServer.Cms.TinyMce.Core;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using EPiServer.ServiceLocation;

namespace EpiCustomFormFieldMapping.Business.Initialization
{
    [ModuleDependency(typeof(TinyMceInitialization))]
    public class ExtendedTinyMceInitialization : IConfigurableModule
    {
        public void Initialize(InitializationEngine context)
        {
        }

        public void Uninitialize(InitializationEngine context)
        {
        }

        public void ConfigureContainer(ServiceConfigurationContext context)
        {
            context.Services.Configure<TinyMceConfiguration>(config =>
            {
                // Add content CSS to the default settings.
                config.Default()
                    .AddPlugin("media wordcount anchor code")
                    .Toolbar("formatselect | epi-personalized-content epi-link anchor numlist bullist indent outdent bold italic underline alignleft aligncenter alignright | image epi-image-editor media code | epi-dnd-processor | removeformat | fullscreen")
                    .AddSetting("image_caption", true)
                    .AddSetting("image_advtab", true)
                    .ContentCss("/static/css/editor.css");

                // This will clone the default settings object and extend it by
                // limiting the block formats for the MainBody property of an ArticlePage.
                config.For<ArticlePage>(t => t.MainBody)
                    .BlockFormats("Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3");

                // Passing a second argument to For<> will clone the given settings object
                // instead of the default one and extend it with some basic toolbar commands.
                config.For<EditorialBlock>(t => t.MainBody, config.Empty())
                    .Plugins(DefaultValues.EpiserverPlugins)
                    .DisableMenubar()
                    .Toolbar("bold italic underline strikethrough");
            });
        }
    }
}
